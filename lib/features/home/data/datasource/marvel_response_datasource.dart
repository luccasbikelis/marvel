import 'dart:convert';
import 'package:marvel/features/home/data/model/character_model.dart';
import 'package:marvel/features/home/data/model/marvel_response_model.dart';
import 'package:marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:marvel/share/base/datasource/datasource.dart';
import 'package:marvel/share/boundaries/http_connection/http_facade.dart';
import 'package:marvel/share/boundaries/shared_preferences/shared_preferences_facade.dart';

class MarvelResponseDataSource implements DataSource {
  final HttpFacade httpFacade;
  final SharedPreferencesFacade sharedPreferences;

  MarvelResponseDataSource(this.httpFacade, this.sharedPreferences);

  @override
  Future<MarvelResponseEntity> call({FromJson? fromJson, Map<String, dynamic>? param, dynamic data}) async {
    const method = HttpMethod.get;
    String endPoint =
        'https://gateway.marvel.com:443/v1/public/characters?apikey=810538ca752433649c5e6bcd62ac1aff&ts=1&hash=c8567700136c75080faf5d0472ff9d28&limit=50';

    // Verifica se existe um valor armazenado para a chave 'marvel_characters'
    final cachedValue = await sharedPreferences.getString('marvel_characters');
    if (cachedValue != null) {
      final listCharacters = MarvelResponseModel.fromSharedPreferencesJson(json.decode(cachedValue));
      return listCharacters;
    }

    final response = await httpFacade(method, endPoint);

    final characters = (response['data']['results'] as List).map((event) => CharacterModel.fromJson(event)).toList();

    final listCharacters = MarvelResponseModel(listCharacters: characters);

    // Armazena o resultado no cache
    await sharedPreferences.set('marvel_characters', json.encode(listCharacters.toJson()));

    return listCharacters;
  }
}

import 'package:com_mottu_marvel/features/home/data/model/character_model.dart';
import 'package:com_mottu_marvel/features/home/data/model/marvel_response_model.dart';
import 'package:com_mottu_marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:com_mottu_marvel/share/base/datasource/datasource.dart';
import 'package:com_mottu_marvel/share/boundaries/http_connection/http_facade.dart';

class MarvelResponseDataSource implements DataSource {
  final HttpFacade httpFacade;

  MarvelResponseDataSource(this.httpFacade);

  @override
  Future<MarvelResponseEntity> call(
      {FromJson? fromJson, Map<String, dynamic>? param, dynamic data}) async {
    
    const method = HttpMethod.get;
    String endPoint =
        'https://gateway.marvel.com:443/v1/public/characters?apikey=810538ca752433649c5e6bcd62ac1aff&ts=1&hash=c8567700136c75080faf5d0472ff9d28';
    final response = await httpFacade(method, endPoint);

    final characters = (response['data']['results'] as List)
        .map((event) => CharacterModel.fromJson(event))
        .toList();

    final listCharacters = MarvelResponseModel(listCharacters: characters);

    return listCharacters;
  }
}

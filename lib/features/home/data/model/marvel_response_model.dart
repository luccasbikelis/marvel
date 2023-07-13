import 'package:marvel/features/home/data/model/character_model.dart';
import 'package:marvel/features/home/domain/entities/character.dart';

import 'package:marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:marvel/share/base/model/model.dart';

class MarvelResponseModel extends MarvelResponseEntity implements Model {
  MarvelResponseModel({
    required List<Character> listCharacters,
  }) : super(listCharacters);

  @override
  Map<String, dynamic> toMap() {
    return {
      'listCharacters': listCharacters.map((characters) => CharacterModel.copy(characters).toMap()).toList(),
    };
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  factory MarvelResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> charactersJson = json['data']['results'];
    List<CharacterModel> characters = charactersJson.map((character) => CharacterModel.fromJson(character)).toList();
    return MarvelResponseModel(listCharacters: characters);
  }

  @override
  factory MarvelResponseModel.fromSharedPreferencesJson(Map<String, dynamic> json) {
    List<dynamic> charactersJson = json['listCharacters'];
    List<CharacterModel> characters = charactersJson.map((character) => CharacterModel.fromSharedPreferencesJson(character)).toList();
    return MarvelResponseModel(listCharacters: characters);
  }

  factory MarvelResponseModel.copy(MarvelResponseEntity marvelResponseEntity) {
    return MarvelResponseModel(
      listCharacters: marvelResponseEntity.listCharacters,
    );
  }
}

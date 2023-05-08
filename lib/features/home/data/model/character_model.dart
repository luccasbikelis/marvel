import 'package:com_mottu_marvel/features/home/domain/entities/character.dart';
import 'package:com_mottu_marvel/share/base/model/model.dart';

class CharacterModel extends Character implements Model {
  CharacterModel({
    required int id,
    required String name,
    required String description,
    required String thumbnailUrl,
  }) : super(id: id, name: name, description: description, 
  thumbnailUrl: thumbnailUrl
  );

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'thumbnail': thumbnailUrl,
      };

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      thumbnailUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      // thumbnailUrl:  json['thumbnail'] ?? ''
    );
  }
   factory CharacterModel.fromSharedPreferencesJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      // thumbnailUrl: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      thumbnailUrl:  json['thumbnail'] ?? ''
    );
  }

  factory CharacterModel.copy(Character character) {
    return CharacterModel(
      id: character.id,
      name: character.name,
      description: character.description,
      thumbnailUrl: character.thumbnailUrl,
    );
  }
}

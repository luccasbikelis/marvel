import 'package:com_mottu_marvel/app/app.dart';
import 'package:com_mottu_marvel/features/home/domain/entities/character.dart';
import 'package:com_mottu_marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:com_mottu_marvel/features/home/domain/usecase/marvel_response_usecase.dart';

import 'package:flutter/material.dart';

class GetCharacterController {
  final MarvelResponseUseCase marvelResponseUseCase;
  final marvelResponseListenable = ValueNotifier<MarvelResponseEntity?>(null);

  GetCharacterController(this.marvelResponseUseCase);

  Future<void> call({int offset = 0}) async {
    try {
      setLoadState(true);
      final result = await marvelResponseUseCase(offset: offset);
      marvelResponseListenable.value = result;
    } catch (error) {
      
      marvelResponseListenable.value = null;
    }
    setLoadState(false);
  }
List<Character> filterCharacters(List<Character> characters, String query) {
  List<Character> filteredList = [];
  for (var character in characters) {
    if (character.name.toLowerCase().contains(query.toLowerCase())) {
      filteredList.add(character);
    }
  }
  return filteredList;
}
   
}
  



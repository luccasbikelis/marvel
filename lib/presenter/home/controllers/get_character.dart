import 'package:com_mottu_marvel/app/app.dart';

import 'package:com_mottu_marvel/features/home/domain/entities/marvel_response_entity.dart';

import 'package:com_mottu_marvel/features/home/domain/usecase/marvel_response_usecase.dart';
import 'package:flutter/material.dart';

class GetCharacterController {
  
  final MarvelResponseUseCase marvelResponseUseCase;

  GetCharacterController(
    
   this.marvelResponseUseCase);

  
  final marvelResponseListenable = ValueNotifier<MarvelResponseEntity?>(null);

  
  Future<void> call() async {
    try {
      setLoadState(true);
      final result = await marvelResponseUseCase();
      marvelResponseListenable.value = result;
    } catch (error) {
      marvelResponseListenable.value == null;
    }
    setLoadState(false);
  }
}

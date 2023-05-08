
import 'package:com_mottu_marvel/app/app.dart';
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

   
}
  



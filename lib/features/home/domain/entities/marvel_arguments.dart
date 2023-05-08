import 'package:com_mottu_marvel/features/home/domain/entities/marvel_response_entity.dart';

class MarvelArguments {
  final MarvelResponseEntity marvelResponseEntity;
  final int index;

  MarvelArguments(this.marvelResponseEntity, this.index);
}
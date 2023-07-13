import 'package:marvel/features/home/domain/entities/marvel_response_entity.dart';

abstract class MarvelResponseRepository {
  Future<MarvelResponseEntity> call({int offset = 0});
}

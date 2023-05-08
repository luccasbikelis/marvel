import 'package:com_mottu_marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:com_mottu_marvel/features/home/domain/repository/marvel_response_repository.dart';


abstract class MarvelResponseUseCase {
  Future<MarvelResponseEntity> call({int offset = 0});
}

class MarvelResponseUseCaseImpl implements MarvelResponseUseCase {
  final MarvelResponseRepository repository;

  MarvelResponseUseCaseImpl(this.repository);

  @override
  Future<MarvelResponseEntity> call({int offset = 0}) async {
    return await repository(offset: offset);
  }
}

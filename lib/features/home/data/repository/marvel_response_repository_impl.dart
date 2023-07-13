import 'package:marvel/features/home/data/model/marvel_response_model.dart';
import 'package:marvel/features/home/domain/entities/marvel_response_entity.dart';
import 'package:marvel/features/home/domain/repository/marvel_response_repository.dart';
import 'package:marvel/share/base/datasource/datasource.dart';

class MarvelResponseRepositoryImpl implements MarvelResponseRepository {
  final DataSource dataSource;

  MarvelResponseRepositoryImpl(this.dataSource);

  @override
  Future<MarvelResponseEntity> call({int offset = 0}) async {
    return await dataSource(fromJson: MarvelResponseModel.fromJson);
  }
}

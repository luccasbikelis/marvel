
import 'package:com_mottu_marvel/features/home/data/datasource/marvel_response_datasource.dart';

import 'package:com_mottu_marvel/features/home/data/repository/marvel_response_repository_impl.dart';

import 'package:com_mottu_marvel/features/home/domain/repository/marvel_response_repository.dart';

import 'package:com_mottu_marvel/features/home/domain/usecase/marvel_response_usecase.dart';
import 'package:com_mottu_marvel/presenter/home/controllers/get_character.dart';
import 'package:com_mottu_marvel/share/boundaries/http_connection/http_facade.dart';
import 'package:get_it/get_it.dart';

class HomeInjector {
  final getIT = GetIt.I;
  call() {


// Marvel Response
 GetIt.I.registerLazySingleton<GetCharacterController>(() => GetCharacterController(
          getIT<MarvelResponseUseCase>(),
        ));
    GetIt.I.registerFactory<MarvelResponseUseCase>(() => MarvelResponseUseCaseImpl(
          GetIt.I<MarvelResponseRepository>(),
        ));
    GetIt.I.registerFactory<MarvelResponseRepository>(() => MarvelResponseRepositoryImpl(
          GetIt.I<MarvelResponseDataSource>(),
        ));
    GetIt.I.registerFactory<MarvelResponseDataSource>(() => MarvelResponseDataSource(
          GetIt.I<HttpFacade>(),
        ));

  
  }
}

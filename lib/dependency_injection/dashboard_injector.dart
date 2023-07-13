import 'package:marvel/features/home/data/datasource/marvel_response_datasource.dart';
import 'package:marvel/features/home/data/repository/marvel_response_repository_impl.dart';
import 'package:marvel/features/home/domain/repository/marvel_response_repository.dart';
import 'package:marvel/features/home/domain/usecase/marvel_response_usecase.dart';
import 'package:marvel/presenter/home/controllers/get_character_controller.dart';
import 'package:marvel/share/boundaries/http_connection/http_facade.dart';
import 'package:marvel/share/boundaries/shared_preferences/shared_preferences_facade.dart';
import 'package:get_it/get_it.dart';

class DashboardInjector {
  final getIT = GetIt.I;
  call() {
    GetIt.I.registerFactory<SharedPreferencesFacade>(() => SharedPreferencesFacade());

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
          GetIt.I<SharedPreferencesFacade>(),
        ));
  }
}

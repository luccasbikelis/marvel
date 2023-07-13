import 'package:marvel/share/boundaries/connectivity/has_connectivity_facade.dart';
import 'package:marvel/share/boundaries/connectivity/has_connectivity_facade_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

class HasConnectivityInjector {
  call() {
    GetIt.I.registerFactory<Connectivity>(() => Connectivity());

    GetIt.I.registerFactory<HasConnectivityFacade>(() => HasConnectivityFacadeImpl(GetIt.I<Connectivity>()));
  }
}

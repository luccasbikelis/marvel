import 'package:marvel/dependency_injection/has_connectivity_injector.dart';
import 'package:marvel/dependency_injection/dashboard_injector.dart';
import 'package:marvel/dependency_injection/http_connection_injector.dart';

class Injector {
  call() {
    DashboardInjector()();
    HasConnectivityInjector()();
    HttpConnectionInjector()();
  }
}

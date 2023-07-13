import 'package:marvel/share/boundaries/connectivity/exception/unavailable_network_exception.dart';
import 'package:marvel/share/boundaries/connectivity/has_connectivity_facade.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HasConnectivityFacadeImpl implements HasConnectivityFacade {
  final Connectivity connectivity;

  HasConnectivityFacadeImpl(this.connectivity);

  @override
  Future<bool> call() async {
    var result = await (connectivity.checkConnectivity());
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return true;
      default:
        throw UnavailableNetworkException('');
    }
  }
}

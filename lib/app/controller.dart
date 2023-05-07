// ignore_for_file: avoid_print

import 'package:com_mottu_marvel/dependency_injection/injector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Controller with ChangeNotifier {
  Controller();

  void loadDependencyInjection() {
    Injector()();
  }

  Future initialization(BuildContext? context) async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  call() async {
    loadDependencyInjection();

    initialization(null);
  }
}

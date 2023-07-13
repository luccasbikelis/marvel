// ignore_for_file: avoid_print

import 'package:marvel/dependency_injection/injector.dart';
import 'package:marvel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Controller with ChangeNotifier {
  Controller();

  Future firebaseCrashlytics() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

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
    firebaseCrashlytics();
    initialization(null);
  }
}

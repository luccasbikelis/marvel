import 'package:marvel/app/app.dart';
import 'package:marvel/app/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Controller controller = Controller();
  await controller();
  runApp(App(controller: controller));
}

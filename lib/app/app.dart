import 'package:marvel/app/components/loading_provider.dart';
import 'package:marvel/app/controller.dart';
import 'package:marvel/app/routes/mottu_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> setLoadState(bool valueStateLoading) async {
  await Future.delayed(Duration.zero, () {
    navigatorKey.currentContext?.read<LoadingProvider>().setLoad(valueStateLoading);
  });
}

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.controller,
    this.child,
  }) : super(key: key);

  final Controller controller;
  final Widget? child;

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (BuildContext context, Widget? child) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return MaterialApp(
            onGenerateRoute: (settings) => routes(settings, widget.controller),
            home: widget.child,
          );
        });
  }
}

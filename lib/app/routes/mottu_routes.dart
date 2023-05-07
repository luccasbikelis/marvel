
import 'package:com_mottu_marvel/app/controller.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

Widget initialPage(RouteSettings routeSettings, Controller controller) {
  Widget initialPage = const HomeView();

  return initialPage;
}

Route<dynamic> routes(RouteSettings routeSettings, Controller controller) {
  Widget page = getPage(routeSettings, controller);
  switch (routeSettings.name) {
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return page;
          });
  }
}

Widget getPage(RouteSettings routeSettings, Controller controller) {
  switch (routeSettings.name) {
    case '/':
      return initialPage(routeSettings, controller);
    case HomeView.routeName:
      return const HomeView();
   
    default:
      return const AppUnknowView();
  }
}
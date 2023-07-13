import 'package:marvel/app/controller.dart';
import 'package:marvel/features/home/domain/entities/marvel_arguments.dart';
import 'package:marvel/presenter/home/ui/content_detail.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

Widget initialPage(RouteSettings routeSettings, Controller controller) {
  Widget initialPage = const DashboardView();

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
    case DashboardView.routeName:
      return const DashboardView();
    case ContentDetail.routeName:
      final marvelArguments = routeSettings.arguments as MarvelArguments;
      return ContentDetail(
        marvelResponseEntity: marvelArguments.marvelResponseEntity,
        index: marvelArguments.index,
      );
    default:
      return const AppUnknowView();
  }
}

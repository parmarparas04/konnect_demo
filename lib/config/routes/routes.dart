import 'package:flutter/material.dart';
import 'package:konnect/presentation/pages/feed_list/feed_list_page.dart';
import 'package:konnect/presentation/pages/home/home_page.dart';
import 'package:konnect/presentation/pages/splash/splash_page.dart';

class Routes {
  static const String homeRoute = "/home";
  static const String feedRoute = "/feed";

  static const String splashRoute = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (ctx) => HomePage());
      case Routes.feedRoute:
        return MaterialPageRoute(builder: (ctx) => FeedListPage());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (ctx) => SplashPage());

      default:
        print(routeSettings.name);
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("No Route found"),
            ),
            body: const Center(
              child: Text("No Route found"),
            )));
  }
}

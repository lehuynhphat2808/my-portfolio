import 'package:flutter/material.dart';
import 'package:portfolio/pages/main_page.dart';
import 'package:portfolio/pages/portfolio_detail_page.dart';

class Routes {
  static const String productDetail = "/productDetail";
  static const String portfolioDetail = "/portfolioDetail";
  static const String mainPage = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.productDetail:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const MainPage());
      case Routes.mainPage:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const MainPage());
      case Routes.portfolioDetail:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const PortfolioDetailPage(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No route found'),
              ),
              body: const Center(
                  child: Text(
                'No route found',
                style: TextStyle(color: Colors.white),
              )),
            ));
  }
}

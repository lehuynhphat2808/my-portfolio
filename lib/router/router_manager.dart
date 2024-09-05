import 'package:flutter/material.dart';
import 'package:portfolio/pages/desktop/chatting_detail.dart';
import 'package:portfolio/pages/desktop/konan_tune_detail.dart';
import 'package:portfolio/pages/desktop/main_page.dart';
import 'package:portfolio/pages/mobile/konan_tune_detail_mobile.dart';
import 'package:portfolio/pages/mobile/main_page_mobile.dart';
import 'package:portfolio/pages/desktop/portfolio_detail_page.dart';
import 'package:portfolio/pages/desktop/quizlet_clone_detail.dart';
import 'package:portfolio/pages/mobile/quizlet_clone_detail_mobile.dart';

import '../data/constants.dart';

class Routes {
  static const String portfolioDetail = "/portfolioDetail";
  static const String quizletCloneDetail = "/quizletCloneDetail";
  static const String konanTuneDetail = "/konanTuneDetail";
  static const String chattingDetail = "/chattingDetail";
  static const String mainPage = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainPage:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) =>
                Constant.isDesktop ? const MainPage() : const MainPageMobile());

      case Routes.portfolioDetail:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const PortfolioDetailPage(),
        );
      case Routes.quizletCloneDetail:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const QuizletCloneDetailPage());
      case Routes.konanTuneDetail:
        return MaterialPageRoute(
            settings: routeSettings,
            // builder: (context) => Constant.isDesktop
            //     ? const KonanTuneDetailPage()
            //     : const KonanTuneDetailPageMobile(),
            builder: (context) => const KonanTuneDetailPage());
      case Routes.chattingDetail:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const ChattingDetailPage());
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/constants.dart';
import 'package:portfolio/router/router_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Constant.isDesktop = defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS;
    return MaterialApp(
      title: 'Le Huynh Phat',
      initialRoute: Routes.mainPage,
      onGenerateRoute: RouteGenerator.getRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/pages/main_page.dart';
import 'package:portfolio/router/router_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Huynh Phat',
      initialRoute: Routes.mainPage,
      onGenerateRoute: RouteGenerator.getRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

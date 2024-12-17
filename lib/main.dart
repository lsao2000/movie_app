import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/pages/splash_page.dart';

void main() {
  runApp(SplashPage(
      onInitilizationComplete: () => runApp(ProviderScope(
            child: MyApp(),
          ))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      initialRoute: "home",
      routes: {
        "home": (BuildContext context) => MainPage(),
      },
    );
  }
}

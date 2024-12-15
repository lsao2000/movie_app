import 'package:flutter/material.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/pages/splash_page.dart';

void main() {
  runApp(SplashPage(onInitilizationComplete: () => runApp(const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      //theme: ThemeData(
      //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //  useMaterial3: true,
      //),
      initialRoute: "home",
      routes: {
        "home": (BuildContext context) => const MainPage(),
      },
      //home: ,
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/app_config.dart';
import 'package:movie_app/services/http_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.onInitilizationComplete});
  final VoidCallback onInitilizationComplete;
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500)).then((value) =>
        _setup(context).then((_) => widget.onInitilizationComplete()));
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = json.decode(configFile);
    getIt.registerSingleton<Config>(Config(
        baseApiUrl: configData["BASE_API_URL"],
        baseImageApiUrl: configData["BASE_IMAGE_API_URL"],
        apiKey: configData["API_KEY"]));
    getIt.registerSingleton<HttpServices>(HttpServices());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/logo.png"))),
        ),
      ),
    );
  }
}

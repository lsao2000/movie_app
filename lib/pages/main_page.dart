import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/services/http_services.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _build();
  }

  Widget _build() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              HttpServices httpServices = HttpServices();
              Response? data = await httpServices.get("movie/upcoming");
              print(data?.data.toString());
            },
            child: Text("fetch")),
      ),
    );
  }
}

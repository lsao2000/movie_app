import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/services/http_services.dart';

class MovieServices {
  final GetIt getIt = GetIt.instance;
  late HttpServices httpServices;
  MovieServices() {
    httpServices = getIt.get<HttpServices>();
  }
  Future<Response> getUpcomingMovies() async {
    Response? data = await httpServices.get("movie/upcoming");
    return data!;
  }
}

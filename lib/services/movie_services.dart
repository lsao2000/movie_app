import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/http_services.dart';

class MovieServices {
  final GetIt getIt = GetIt.instance;
  late HttpServices httpServices;
  MovieServices() {
    httpServices = getIt.get<HttpServices>();
  }
  Future<List<Movie>> getMovies(
      {required String type, required int page}) async {
    Response? data =
        await httpServices.get("movie/$type", query: {"page": page});
    List<dynamic> lstMovies = await data?.data["results"];
    List<Movie> allMovies = lstMovies.map((el) => Movie.fromJson(el)).toList();
    if (data?.statusCode == 200) {
      return allMovies;
    }
    throw Exception("couldn't load latest movies");
  }

  Future<List<Movie>> searchMovies(
      {required String searchQuery, required int page}) async {
    Response? data = await httpServices.search("search/movie", searchQuery);
    if (data!.statusCode == 200) {
      Map getData = data.data;
      List<Movie> movies =
          getData['results'].map<Movie>((el) => Movie.fromJson(el)).toList();
      return movies;
    }
    return [];
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/app_config.dart';

class HttpServices {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _apiKey;
  late String _baseUrl;
  HttpServices() {
    Config config = getIt.get<Config>();
    _baseUrl = config.baseApiUrl;
    _apiKey = config.apiKey;
  }
  Future<Response?> get(String type, {Map<String, dynamic>? query}) async {
    try {
      String url = "$_baseUrl/$type";
      Map<String, dynamic> query = {"api_key": _apiKey, "language": "en_US"};
      return await dio.get(url, queryParameters: query);
    } on DioException catch (e) {
      print("Error ${e.message.toString()}");
      return null;
      //return dio.
    }
  }

  Future<Response?> search(String type, String searchQuery) async {
    try {
      String url = "$_baseUrl/$type";
      Map<String, dynamic> query = {
        "api_key": _apiKey,
        "language": "en_US",
        "query":searchQuery
      };
      return await dio.get(url, queryParameters: query);
    } on DioException catch (e) {
      print("Error ${e.message.toString()}");
      return null;
    }
  }
}

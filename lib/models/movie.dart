import 'package:get_it/get_it.dart';
import 'package:movie_app/models/app_config.dart';

class Movie {
  late String name;
  late String? language;
  late bool? isAdult;
  late String description;
  late String? posterPath;
  late String? backdropPath;
  late num rating;
  late String releaseDate;

  Movie(
      {required this.name,
      required this.language,
      required this.isAdult,
      required this.description,
      required this.posterPath,
      required this.backdropPath,
      required this.rating,
      required this.releaseDate});
  factory Movie.fromJson(Map<String, dynamic> jsonData) {
    return Movie(
        name: jsonData['title'],
        language: jsonData['original_language'],
        isAdult: jsonData['adult'],
        description: jsonData['overview'] ?? "",
        posterPath: jsonData['poster_path'] ?? "",
        backdropPath: jsonData['backdrop_path'] ?? "",
        rating: jsonData['vote_average'],
        releaseDate: jsonData['release_date']);
  }
  String getPosterUrl() {
    final Config appConfig = GetIt.instance.get<Config>();
    return "${appConfig.baseImageApiUrl}/$posterPath";
  }

  @override
  String toString() {
    //return "Movie [name: $name, language: $language, isAdult: $isAdult, description: $description,posterPath : $posterPath, backdrop_path: $backdropPath, rating: $rating, releaseDate: $releaseDate ]";
    return "Movie [isAdult : $isAdult, posterPath: $posterPath, language: $language, backdropPath: $backdropPath]";
  }
}

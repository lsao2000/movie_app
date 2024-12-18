import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';

class MainPageData {
  late String searchCategory;
  late List<Movie> lstMovies;
  late int page;
  late String searchText;
  MainPageData(
      {required this.searchCategory,
      required this.lstMovies,
      required this.page,
      required this.searchText});

  MainPageData.initial()
      : lstMovies = [],
        page = 1,
        searchCategory = SearchCategory.popular,
        searchText = "";

  MainPageData copyWith(
      {required List<Movie> movies,
      required int page,
      required String searchText,
      required String searchCategory}) {
    return MainPageData(
        searchCategory: searchCategory,
        lstMovies: lstMovies,
        page: page,
        searchText: searchText);
  }

}

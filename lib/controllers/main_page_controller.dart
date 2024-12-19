import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/main_page_data.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';
import 'package:movie_app/services/movie_services.dart';

class MainPageController extends StateNotifier<MainPageData> {
  MainPageController(super._state) {
    getMovies();
  }
  final MovieServices movieServices = GetIt.instance.get<MovieServices>();
  void updateCategory({required String category}) {
    var mainPageData = MainPageData(
        searchCategory: category == SearchCategory.popular.toLowerCase()
            ? SearchCategory.upcoming
            : SearchCategory.popular,
        lstMovies: [],
        page: state.page,
        searchText: "");
    state = mainPageData;
    getMovies();
  }

  void getMovies() async {
    var allMovies = await movieServices.getMovies(
        type: state.searchCategory.toLowerCase(), page: state.page);
    String searchCategory = state.searchCategory;
    //print("-----------------${lstMovies}");
    state = MainPageData(
        searchCategory: searchCategory,
        lstMovies: allMovies,
        page: 1,
        searchText: "");
  }
}

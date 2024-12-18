import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/main_page_data.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_services.dart';

class MainPageController extends StateNotifier<MainPageData> {
  MainPageController(super._state) {
    _getMovies();
  }
  final MovieServices movieServices = GetIt.instance.get<MovieServices>();
  void updateCategory({required String category}) {
    //var mainPageData = MainPageData(category);
    //state = mainPageData;
  }
  void _getMovies() async {
    var movies =
        await movieServices.getMovies(type: state.searchCategory.toLowerCase());
    List<dynamic> lstMovies = await movies.data["results"];
    List<Movie> allMovies = lstMovies.map((el) => Movie.fromJson(el)).toList();
    String searchCategory = state.searchCategory;
    //var data = lstMovies
    //print("-----------------${lstMovies}");
    state = MainPageData(
        searchCategory: searchCategory,
        lstMovies: allMovies,
        page: 1,
        searchText: "");
  }
}

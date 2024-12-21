import 'package:flutter/material.dart';
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
    if (state.searchCategory != category) {
      var mainPageData = MainPageData(
          searchCategory: category,
          lstMovies: [],
          page: state.page,
          searchText: "");
      state = mainPageData;
      getMovies();
    }
  }

  void getMovies() async {
    var allMovies = await movieServices.getMovies(
        type: state.searchCategory.toLowerCase(), page: state.page);
    String searchCategory = state.searchCategory;
    state = MainPageData(
        searchCategory: searchCategory,
        lstMovies: allMovies,
        page: 1,
        searchText: "");
  }

  void searchMovie({required String querySearch}) async {
    await movieServices
        .searchMovies(searchQuery: querySearch, page: state.page)
        .then((value) {
      print(value);
      var searchCategory = state.searchCategory;
      if (value.isNotEmpty) {
        state = MainPageData(
            searchCategory: searchCategory,
            lstMovies: value,
            page: 1,
            searchText: "the last of us");
      }
    });
  }
}

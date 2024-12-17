import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/main_page_data.dart';
import 'package:movie_app/models/search_category.dart';

class MainPageController extends StateNotifier<MainPageData> {
  MainPageController(super._state);
  void updateCategory({required String category}) {
    var mainPageData = MainPageData(category);
    state = mainPageData;
  }
}

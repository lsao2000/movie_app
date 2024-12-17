import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/controllers/main_page_controller.dart';
import 'package:movie_app/models/main_page_data.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search_category.dart';
import 'package:movie_app/pages/movie_screen.dart';

//var categoryType = StateProvider<String>((ref) => SearchCategory.popular);
var mainPageProvider = StateNotifierProvider<MainPageController, MainPageData>(
    (ref) => MainPageController(MainPageData(SearchCategory.popular)));

enum Rating { oneStar, twoStar, threeStar, fourStar, fiveStar }

class MainPage extends ConsumerWidget {
  MainPage({super.key});
  final TextEditingController _searchController = TextEditingController();
  //String category = SearchCategory.popular;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _build(width: width, height: height, ref: ref);
  }

  Widget _build(
      {required double height, required double width, required WidgetRef ref}) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(width: width, height: height),
            _forgroundWidget(width: width, height: height, ref: ref)
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.01),
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://images-na.ssl-images-amazon.com/images/I/91B32iU7ayL._AC_SL1500_.jpg",
            )),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget _forgroundWidget(
      {required double width, required double height, required WidgetRef ref}) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
      width: width * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(width: width, height: height, ref: ref),
          Container(
            height: height * 0.83,
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: _moviesListWidget(height: height, width: width),
          )
        ],
      ),
    );
  }

  Widget _topBarWidget(
      {required double width, required double height, required WidgetRef ref}) {
    return Container(
      height: height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.04),
          color: Colors.black38),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(width: width, height: height),
          _categoryWidget(width: width, height: height, ref: ref)
        ],
      ),
    );
  }

  Widget _searchFieldWidget({required double width, required double height}) {
    final _border = InputBorder.none;
    return Container(
      width: width * 0.50,
      height: height * 0.05,
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: _border,
          border: _border,
          hintText: "Search...",
          hintStyle: const TextStyle(color: Colors.white38),
          filled: false,
          fillColor: Colors.white24,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        onSubmitted: (value) {},
      ),
    );
  }

  Widget _categoryWidget(
      {required double width, required double height, required WidgetRef ref}) {
    //String category = ref.watch(categoryType);
    MainPageData category = ref.watch(mainPageProvider);
    return DropdownButton(
      onChanged: (value) {
        ref.watch(mainPageProvider.notifier).updateCategory(category: value);
      },
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      dropdownColor: Colors.black38,
      value: category.searchCategory,
      //value: SearchCategory.popular,
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      items: const <DropdownMenuItem>[
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upcoming,
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _moviesListWidget({required double height, required double width}) {
    List<Movie> movies = [];
    for (var i = 0; i < 20; i++) {
      movies.add(Movie(
          name: "Elevation",
          language: "AR",
          isAdult: false,
          description:
              "A single father and two women venture from the safety of their homes to face monstrous creatures to save the life of a young boy.",
          posterPath: "uQhYBxOVFU6s9agD49FnGHwJqG5.jpg",
          backdropPath: "/au3o84ub27qTZiMiEc9UYzN74V3.jpg",
          rating: 4.8,
          releaseDate: "2024/17/12"));
    }
    if (movies.isNotEmpty) {
      return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: height * 0.01, horizontal: 0),
              child: GestureDetector(
                onTap: () {},
                child: MovieScreen(movie: movies[index]),
              ),
            );
          });
    }
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          ClipRRect(
              //borderRadius: BorderRadius.circular(width * 0.03),
            child: Image.network(
              movie.getPosterUrl(),
              fit: BoxFit.fill,
              width: width * 0.3,
              height: height * 0.2,
            ),
          )
        ],
      ),
    );
  }
}

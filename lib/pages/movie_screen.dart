import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            //borderRadius: BorderRadius.circular(width * 0.03),
            child: Image.network(
              movie.getPosterUrl(),
              fit: BoxFit.fill,
              width: width * 0.3,
              height: height * 0.2,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(left: width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  topInfoWidget(width: width, height: height),
                  middleInfoWidget(width: width, height: height, movie: movie),
                  Text(
                    movie.description,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topInfoWidget({required double width, required double height}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(right: width * 0.06),
          width: width * 0.4,
          child: Text(
            movie.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          movie.rating.toDouble().toStringAsFixed(1).toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget middleInfoWidget(
      {required double width, required double height, required Movie movie}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: movie.language),
      TextSpan(text: " | "),
      TextSpan(text: "P: ${movie.isAdult}"),
      TextSpan(text: " | "),
      TextSpan(text: movie.releaseDate),
    ]));
  }
}

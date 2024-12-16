import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _build(width: width, height: height);
  }

  Widget _build({required double height, required double width}) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Stack(
          children: [
            _backgroundWidget(width: width, height: height),
            _forgroundWidget(width: width, height: height)
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

  Widget _forgroundWidget({required double width, required double height}) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
        width:  width * 0.88,
        );
  }
}

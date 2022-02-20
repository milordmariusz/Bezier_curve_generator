import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Stack(
          children: [
            ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.deepOrangeAccent,
                  height: 400,
                ),
            ),
            ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.green,
                  height: 200,
                ),
            ),

          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  var rng = Random();

  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - doubleInRange(rng, 10, 90));
    var firstCurve = Offset(size.width / doubleInRange(rng, 3, 7),
        size.height - doubleInRange(rng, 0, 30));
    var secondCurve = Offset(
        size.width - (size.width / doubleInRange(rng, 2, 4)),
        size.height - doubleInRange(rng, 50, 150));
    var pathEnd = Offset(size.width, size.height - doubleInRange(rng, 0, 90));
    path.cubicTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy,
        pathEnd.dx, pathEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}

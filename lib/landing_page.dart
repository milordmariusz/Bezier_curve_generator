import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  late Path ultimate;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(isShadow: true),
              child: Container(
                color: Colors.black,
                height: (MediaQuery.of(context).size.height) -
                    MediaQuery.of(context).size.height / 5 +
                    50,
              ),
            ),
            ClipPath(
              clipper: WaveClipper(isShadow: true),
              child: Container(
                color: Colors.blue,
                height: (MediaQuery.of(context).size.height) -
                    MediaQuery.of(context).size.height / 5 * 2 +
                    50,
              ),
            ),
            ClipPath(
              clipper: WaveClipper(isShadow: true),
              child: Container(
                color: Colors.green,
                height: (MediaQuery.of(context).size.height) -
                    MediaQuery.of(context).size.height / 5 * 3 +
                    50,
              ),
            ),
            ClipPath(
              clipper: WaveClipper(isShadow: true),
              child: Container(
                color: Colors.yellow,
                height: (MediaQuery.of(context).size.height) -
                    MediaQuery.of(context).size.height / 5 * 4 +
                    50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  WaveClipper({required this.isShadow});

  bool isShadow;

  @override
  var rng = Random();

  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - doubleInRange(rng, 5, 200));
    var firstCurve = Offset(size.width / doubleInRange(rng, 3, 8),
        size.height - doubleInRange(rng, 0, 100));
    var secondCurve = Offset(
        size.width - (size.width / doubleInRange(rng, 2, 5)),
        size.height - doubleInRange(rng, 30, 200));
    var pathEnd = Offset(size.width, size.height - doubleInRange(rng, 0, 230));
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
    return true;
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var rng = Random();
double curveData1 = 0;
double curveData2 = 0;
double curveData3 = 0;
double curveData4 = 0;
double curveData5 = 0;
double curveData6 = 0;

class CurveGeneratorPage extends StatefulWidget {
  const CurveGeneratorPage({Key? key}) : super(key: key);

  @override
  _CurveGenerator createState() => _CurveGenerator();
}

class _CurveGenerator extends State<CurveGeneratorPage> {
  late CustomClipper<Path>? list;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Stack(
          children: [
            ClipShadowPath(
              shadow: const BoxShadow(
                color: Colors.black,
                offset: Offset(0, 7),
                blurRadius: 10,
                spreadRadius: 8,
              ),
              clipper: WaveClipper(isShadow: false),
              child: Container(
                color: Colors.orangeAccent,
                height: (MediaQuery.of(context).size.height) -
                    MediaQuery.of(context).size.height / 5 +
                    50,
              ),
            ),
            ClipPath(
              clipper: WaveClipper(isShadow: true),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            ClipShadowPath(
              shadow: const BoxShadow(
                color: Colors.black,
                offset: Offset(0, 7),
                blurRadius: 10,
                spreadRadius: 8,
              ),
              clipper: WaveClipper(isShadow: false),
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
                color: Colors.transparent,
              ),
            ),
            ClipShadowPath(
              shadow: const BoxShadow(
                color: Colors.black,
                offset: Offset(0, 7),
                blurRadius: 10,
                spreadRadius: 8,
              ),
              clipper: WaveClipper(isShadow: false),
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
                color: Colors.transparent,
              ),
            ),
            ClipShadowPath(
              shadow: const BoxShadow(
                color: Colors.black,
                offset: Offset(0, 7),
                blurRadius: 10,
                spreadRadius: 8,
              ),
              clipper: WaveClipper(isShadow: false),
              child: Container(
                color: Colors.yellow,
                height: (MediaQuery.of(context).size.height) -
                    MediaQuery.of(context).size.height / 5 * 4 +
                    50,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final BoxShadow shadow;

  final CustomClipper<Path> clipper;

  final Widget child;

  const ClipShadowPath({
    Key? key,
    required this.shadow,
    required this.clipper,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(child: child, clipper: clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final BoxShadow shadow;

  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadow.spreadRadius,
      );

    var clipPath = clipper.getClip(size).shift(shadow.offset);

    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class WaveClipper extends CustomClipper<Path> {
  WaveClipper({required this.isShadow});

  bool isShadow;

  @override
  Path getClip(Size size) {
    if (isShadow) {
      curveDataMaker();
    }
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height - curveData1);
    var firstCurve = Offset(size.width / curveData2, size.height - curveData3);
    var secondCurve = Offset(
        size.width - (size.width / curveData4), size.height - curveData5);
    var pathEnd = Offset(size.width, size.height - curveData6);
    path.cubicTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy,
        pathEnd.dx, pathEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  void curveDataMaker() {
    curveData1 = doubleInRange(rng, 5, 200);
    curveData2 = doubleInRange(rng, 3, 8);
    curveData3 = doubleInRange(rng, 0, 100);
    curveData4 = doubleInRange(rng, 2, 5);
    curveData5 = doubleInRange(rng, 30, 200);
    curveData6 = doubleInRange(rng, 0, 230);
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

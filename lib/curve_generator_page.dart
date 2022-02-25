import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var rng = Random();
double curveData1 = 0;
double curveData2 = 0;
double curveData3 = 0;
double curveData4 = 0;
double curveData5 = 0;
double curveData6 = 0;


class CurveGeneratorPage extends StatefulWidget {
  CurveGeneratorPage({Key? key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.color5,
  }) : super(key: key);

  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color color5;

  @override
  _CurveGenerator createState() => _CurveGenerator();
}

class _CurveGenerator extends State<CurveGeneratorPage> {

  @override
  void initState() {
    WaveClipper wc = WaveClipper(isShadow: false);
    wc.curveDataMaker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color1,
        body: SafeArea(
          top: false,
          child: Stack(
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
                  color: widget.color2,
                  height: (MediaQuery.of(context).size.height) -
                      MediaQuery.of(context).size.height / 5 +
                      80,
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
                  color: widget.color3,
                  height: (MediaQuery.of(context).size.height) -
                      MediaQuery.of(context).size.height / 5 * 2 +
                      80,
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
                  color: widget.color4,
                  height: (MediaQuery.of(context).size.height) -
                      MediaQuery.of(context).size.height / 5 * 3 +
                      80,
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
                  color: widget.color5,
                  height: (MediaQuery.of(context).size.height) -
                      MediaQuery.of(context).size.height / 5 * 4 +
                      80,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                onLongPress: (){
                  Navigator.pop(context);
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

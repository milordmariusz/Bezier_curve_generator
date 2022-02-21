import 'dart:io';

import 'package:bezier_curve_generator/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'color_page.dart';
import 'curve_generator_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: AppColors.whiteBackground,
        ),
      ),
        ClipShadowPath(
          shadow: const BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(0, 7),
            blurRadius: 10,
            spreadRadius: 4,
          ),
          clipper: SecondWaveClipperTitle(),
          child: Container(
            color: AppColors.whiteBackground,
            height: (MediaQuery.of(context).size.height) -
                MediaQuery.of(context).size.height / 5 +
                50,
          ),
        ),
        ClipShadowPath(
          shadow: const BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(0, 7),
            blurRadius: 10,
            spreadRadius: 4,
          ),
          clipper: FirstWaveClipperTitle(),
          child: Container(
            color: AppColors.whiteBackground,
            height: (MediaQuery.of(context).size.height) -
                MediaQuery.of(context).size.height / 5 +
                50,
          ),
        ),
        Align(
          alignment: Alignment(-0.75,-0.60),
          child: NeumorphicText(
            "Bezier",
            style: NeumorphicStyle(
              depth: 5,
              color: Colors.blueGrey,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold, //customize size here
              // AND others usual text style properties (fontFamily, fontWeight, ...)
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.75,-0.30),
          child: NeumorphicText(
            "Curve",
            style: NeumorphicStyle(
              depth: 5,
              color: Colors.blueGrey,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold, //customize size here
              // AND others usual text style properties (fontFamily, fontWeight, ...)
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.75,-0.0),
          child: NeumorphicText(
            "Generator",
            style: NeumorphicStyle(
              depth: 5,
              color: Colors.blueGrey,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold, //customize size here
              // AND others usual text style properties (fontFamily, fontWeight, ...)
            ),
          ),
        ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 400),
            Container(
                height: 200,
                width: 200,
                child: NeumorphicButton(
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ColorPage()));
                  },
                  style: NeumorphicStyle(
                    color: AppColors.whiteBackground,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: NeumorphicText(
                      "Start",
                      style: NeumorphicStyle(
                          border: NeumorphicBorder(
                            color: Color(0x33000000),
                            width: 0.7,
                          ),
                          depth: 4, //customize depth here
                          color: Color(0xFF1ECCFA) //customize color here
                          ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold, //customize size here
                        // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ]
    );
  }
}
class FirstWaveClipperTitle extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height / 2 - 80);
    var firstCurve = Offset(size.width / 2.5, size.height / 2 - 140);
    var secondCurve = Offset(
        size.width - (size.width / 2.5), size.height / 2-40);
    var pathEnd = Offset(size.width, size.height / 2 - 140);
    path.cubicTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy,
        pathEnd.dx, pathEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondWaveClipperTitle extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height / 2-50);
    var firstCurve = Offset(size.width / 2, size.height / 2 - 50);
    var secondCurve = Offset(
        size.width - (size.width / 4), size.height / 2 + 50);
    var pathEnd = Offset(size.width, size.height / 2 + 40);
    path.cubicTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy,
        pathEnd.dx, pathEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

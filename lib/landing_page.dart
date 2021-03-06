import 'package:auto_size_text/auto_size_text.dart';
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
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.whiteBackground,
        ),
      ),
      ClipShadowPath(
        shadow: const BoxShadow(
          color: AppColors.textColor,
          offset: Offset(0, 7),
          blurRadius: 10,
          spreadRadius: 4,
        ),
        clipper: _SecondWaveClipperTitle(),
        child: Container(
          color: AppColors.whiteBackground,
          height: (MediaQuery.of(context).size.height) -
              MediaQuery.of(context).size.height / 5 +
              50,
        ),
      ),
      ClipShadowPath(
        shadow: const BoxShadow(
          color: AppColors.textColor,
          offset: Offset(0, 7),
          blurRadius: 10,
          spreadRadius: 4,
        ),
        clipper: _FirstWaveClipperTitle(),
        child: Container(
          color: AppColors.whiteBackground,
          height: (MediaQuery.of(context).size.height) -
              MediaQuery.of(context).size.height / 5 +
              50,
        ),
      ),
      const Align(
        alignment: Alignment(0.9, -0.9),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Icon(
            Icons.info_outline_rounded,
            color: AppColors.textColor,
          ),
        ),
      ),
      Align(
        alignment: const Alignment(0.9, -0.9),
        child: SizedBox(
          height: 50,
          width: 50,
          child: NeumorphicButton(
            onPressed: () {
              _infoDialog();
            },
            style: NeumorphicStyle(
              intensity: 1,
              color: Colors.transparent,
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
          ),
        ),
      ),
      Align(
        alignment: const Alignment(-0.75, -0.60),
        child: AutoSizeText(
          "Bezier",
          style: GoogleFonts.raleway(
            decoration: TextDecoration.none,
            color: AppColors.textColor,
            fontSize: MediaQuery.of(context).size.width/7,
          ),
          maxFontSize: 60,
        ),
      ),
      Align(
        alignment: const Alignment(0.75, -0.28),
        child: AutoSizeText(
          "Curve",
          style: GoogleFonts.raleway(
            decoration: TextDecoration.none,
            color: AppColors.textColor,
            fontSize: MediaQuery.of(context).size.width/7,
          ),
          maxFontSize: 60,
        ),
      ),
      Align(
        alignment: const Alignment(-0.75, 0.01),
        child: AutoSizeText(
          "Generator",
          style: GoogleFonts.raleway(
            decoration: TextDecoration.none,
            color: AppColors.textColor,
            fontSize: MediaQuery.of(context).size.width/7,
          ),
          maxFontSize: 60,
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/2),
            Container(
              constraints: BoxConstraints(
                maxWidth: 200, maxHeight: 200
              ),
              child: SizedBox(
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  child: NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ColorPage()));
                    },
                    style: NeumorphicStyle(
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      depth: 10,
                      intensity: 1,
                      boxShape:
                          NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Start",
                          style: GoogleFonts.raleway(
                            decoration: TextDecoration.none,
                            color: AppColors.textColor,
                            fontSize: MediaQuery.of(context).size.width/6,
                          ),
                          maxFontSize: 60,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    ]);
  }

  Future<void> _infoDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: const Align(
              alignment: Alignment.center,
              child: Text('How to use app?'),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "This is a simple Bezier curves image generator.\nAfter selecting 5 colors and pressing the \"Generate\" button:\n"),
                Row(
                  children: const [
                    Icon(Icons.touch_app),
                    Text("Tap: Generate new image.")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(Icons.touch_app),
                    Text("Hold: Return to color menu.")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "If you like what has been generated, you can take a screenshot and set it as wallpaper."),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: const Text(
                    'Return',
                    style: TextStyle(fontSize: 25, color: AppColors.textColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ));
      },
    );
  }
}

class _FirstWaveClipperTitle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height / 2 - 80);
    var firstCurve = Offset(size.width / 2.5, size.height / 2 - 140);
    var secondCurve =
        Offset(size.width - (size.width / 2.5), size.height / 2 - 40);
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

class _SecondWaveClipperTitle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height / 2 - 50);
    var firstCurve = Offset(size.width / 2, size.height / 2 - 50);
    var secondCurve =
        Offset(size.width - (size.width / 4), size.height / 2 + 50);
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

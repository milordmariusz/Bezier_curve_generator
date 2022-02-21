import 'package:bezier_curve_generator/curve_generator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class ColorPage extends StatefulWidget {
  ColorPage({Key? key}) : super(key: key);

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;
  Color color5 = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: AppColors.whiteBackground,
        ),
      ),
      Center(
        child: Container(
          height: size.height - 50,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  color: color1,
                  boxShape: NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(width: 50),
              Container(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Pick Your Color'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                      pickerColor: color1,
                                      labelTypes: const [],
                                      enableAlpha: false,
                                      onColorChanged: (color) =>
                                          setState(() => color1 = color)),
                                  TextButton(
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    style: NeumorphicStyle(
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.archivoBlack(//customize depth here
                          color: color1,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],//customize color here
                        ),// AND others usual text style properties (fontFamily, fontWeight, ...)
                        ),
                      ),
                    ),
                  ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  color: color2,
                  boxShape: NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(width: 50),
              Container(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Pick Your Color'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                      pickerColor: color2,
                                      labelTypes: const [],
                                      enableAlpha: false,
                                      onColorChanged: (color) =>
                                          setState(() => color2 = color)),
                                  TextButton(
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    style: NeumorphicStyle(
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.archivoBlack(//customize depth here
                          color: color2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],//customize color here
                        ),// AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  color: color3,
                  boxShape: NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(width: 50),
              Container(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Pick Your Color'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                      pickerColor: color3,
                                      labelTypes: const [],
                                      enableAlpha: false,
                                      onColorChanged: (color) =>
                                          setState(() => color3 = color)),
                                  TextButton(
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    style: NeumorphicStyle(
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.archivoBlack(//customize depth here
                          color: color3,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],//customize color here
                        ),// AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  color: color4,
                  boxShape: NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(width: 50),
              Container(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Pick Your Color'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                      pickerColor: color4,
                                      labelTypes: const [],
                                      enableAlpha: false,
                                      onColorChanged: (color) =>
                                          setState(() => color4 = color)),
                                  TextButton(
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    style: NeumorphicStyle(
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.archivoBlack(//customize depth here
                          color: color4,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],//customize color here
                        ),// AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  color: color5,
                  boxShape: NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: Container(
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(width: 50),
              Container(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Pick Your Color'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                      pickerColor: color5,
                                      labelTypes: const [],
                                      enableAlpha: false,
                                      onColorChanged: (color) =>
                                          setState(() => color5 = color)),
                                  TextButton(
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                    style: NeumorphicStyle(
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.archivoBlack(//customize depth here
                          color: color5,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                          //customize color here
                        ),// AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  )),
            ],
          ),

          Container(
              height: 55,
              width: 250,
              child: NeumorphicButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurveGeneratorPage(
                              color1: color5,
                              color2: color4,
                              color3: color3,
                              color4: color2,
                              color5: color1,
                            )),
                  );
                },
                style: NeumorphicStyle(
                  color: AppColors.whiteBackground,
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                ),
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Text(
                    "Generate",
                    style: GoogleFonts.archivoBlack(//customize depth here
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],//customize color here
                    ),
                  ),
                ),
              )),
          SizedBox(height: 20),
        ],
      ),
    ]);
  }
}

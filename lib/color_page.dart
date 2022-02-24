import 'package:bezier_curve_generator/curve_generator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;
  Color color5 = Colors.white;

  Future<void> _colorPickerDialog(Color colorx, String colorLabel) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Pick Your Color'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColorPicker(
                    pickerColor: colorx,
                    labelTypes: const [],
                    enableAlpha: false,
                    onColorChanged: (color) => setState(() {
                          if (colorLabel == "color1") {
                            color1 = color;
                          } else if (colorLabel == "color2") {
                            color2 = color;
                          } else if (colorLabel == "color3") {
                            color3 = color;
                          } else if (colorLabel == "color4") {
                            color4 = color;
                          } else {
                            color5 = color;
                          }
                        })),
                TextButton(
                  child: const Text(
                    'SELECT',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ));
      },
    );
  }

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
      Align(
        alignment: const Alignment(0.0, -0.3),
        child: Container(
          height: size.height - 80,
          width: 330,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  color: color1,
                  boxShape: const NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color1, "color1");
                    },
                    style: NeumorphicStyle(
                      color: color1,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      boxShape: const NeumorphicBoxShape.circle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                height: 55,
                width: 175,
                child: NeumorphicButton(
                  onPressed: () {
                    _colorPickerDialog(color1, "color1");
                  },
                  style: NeumorphicStyle(
                    color: AppColors.whiteBackground,
                    shape: NeumorphicShape.flat,
                    intensity: 1,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                  ),
                  child: Center(
                    child: Text(
                      "Pick Color",
                      style: GoogleFonts.raleway(
                        color: AppColors.textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ), // AND others usual text style properties (fontFamily, fontWeight, ...)
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
                  boxShape: const NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color2, "color2");
                    },
                    style: NeumorphicStyle(
                      color: color2,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      boxShape: const NeumorphicBoxShape.circle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color2, "color2");
                    },
                    style: NeumorphicStyle(
                      intensity: 1,
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.raleway(
                          color: AppColors.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ), // AND others usual text style properties (fontFamily, fontWeight, ...)
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
                  boxShape: const NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color3, "color3");
                    },
                    style: NeumorphicStyle(
                      color: color3,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      boxShape: const NeumorphicBoxShape.circle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color3, "color3");
                    },
                    style: NeumorphicStyle(
                      intensity: 1,
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.raleway(
                          color: AppColors.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ), // AND others usual text style properties (fontFamily, fontWeight, ...)
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
                  boxShape: const NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color4, "color4");
                    },
                    style: NeumorphicStyle(
                      color: color4,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      boxShape: const NeumorphicBoxShape.circle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color4, "color4");
                    },
                    style: NeumorphicStyle(
                      intensity: 1,
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.raleway(
                          color: AppColors.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ), // AND others usual text style properties (fontFamily, fontWeight, ...)
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
                  boxShape: const NeumorphicBoxShape.circle(),
                  intensity: 1,
                  depth: -20,
                  lightSource: LightSource.topLeft,
                ),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color5, "color5");
                    },
                    style: NeumorphicStyle(
                      color: color5,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                      boxShape: const NeumorphicBoxShape.circle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                  height: 55,
                  width: 175,
                  child: NeumorphicButton(
                    onPressed: () {
                      _colorPickerDialog(color5, "color5");
                    },
                    style: NeumorphicStyle(
                      intensity: 1,
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30)),
                      //border: NeumorphicBorder()
                    ),
                    child: Center(
                      child: Text(
                        "Pick Color",
                        style: GoogleFonts.raleway(
                          color: AppColors.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ), // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                    child: NeumorphicButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: const NeumorphicStyle(
                        intensity: 1,
                        color: AppColors.whiteBackground,
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_back_rounded,
                            color: AppColors.textColor,
                          ),
                        ],
                      ),
                    ),
                  ),
              const SizedBox(width: 30),
              SizedBox(
                  height: 60,
                  width: 200,
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
                      intensity: 1,
                      color: AppColors.whiteBackground,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30)),
                    ),
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Center(
                      child: Text(
                        "Generate",
                        style: GoogleFonts.raleway(
                          color: AppColors.textColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    ]);
  }
}

import 'package:bezier_curve_generator/curve_generator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class ColorPage extends StatefulWidget {
  ColorPage({Key? key}) : super(key: key);

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color color1 = Colors.red;
  Color color2 = Colors.green;
  Color color3 = Colors.blue;
  Color color4 = Colors.orange;
  Color color5 = Colors.purple;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.bgColor,
            AppColors.gradientColor,
          ],
        )),
      ),
      Center(
        child: Container(
          height: size.height - 80,
          width: size.width - 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color1,
                ),
                width: 110,
                height: 110,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonColor,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Pick Color',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                                  onColorChanged: (color) =>
                                      setState(() => color1 = color)),
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color2,
                ),
                width: 110,
                height: 110,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonColor,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Pick Color',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                                  onColorChanged: (color) =>
                                      setState(() => color2 = color)),
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color3,
                ),
                width: 110,
                height: 110,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonColor,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Pick Color',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                                  onColorChanged: (color) =>
                                      setState(() => color3 = color)),
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color4,
                ),
                width: 110,
                height: 110,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonColor,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Pick Color',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (){
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
                                  onColorChanged: (color) =>
                                      setState(() => color4 = color)),
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color5,
                ),
                width: 110,
                height: 110,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.buttonColor,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    'Pick Color',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                    onColorChanged: (color) =>
                                        setState(() => color5 = color)),
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
                  }),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    ]);
  }

  Widget buildColorPicker(Color colorend) => ColorPicker(
        pickerColor: colorend,
        onColorChanged: (color) => setState(() => colorend = color),
      );

  void pickColor(BuildContext context, Color colorend) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Pick Your Color'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildColorPicker(colorend),
                TextButton(
                  child: const Text(
                    'SELECT',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            )),
      );
}

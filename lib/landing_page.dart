import 'package:bezier_curve_generator/color_page.dart';
import 'package:bezier_curve_generator/curve_generator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bezier curve generator',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 200),
            SizedBox(
              width: size.width * 0.8,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonColor,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Generate painting',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
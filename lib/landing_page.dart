import 'dart:io';

import 'package:bezier_curve_generator/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'color_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bezier curve generator',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 200),
          Center(
              child: GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
                boxShadow: _isElevated
                    ? [
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
                      ]
                    : null,
              ),
            ),
            onTap: (){
              setState(() {
                _isElevated = !_isElevated;
                Navigator.push(
                    context,
                    MyRoute(
                    builder: (context) => ColorPage()));
              });
            },
          )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(milliseconds: 1500);
}



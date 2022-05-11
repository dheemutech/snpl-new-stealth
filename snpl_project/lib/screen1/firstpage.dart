// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snpl_project/screen1/landingpage.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: AnimatedSplashScreen(
          backgroundColor: const Color(0xff3c80FF),
          duration: 3000,
          splash: Text(
            'SPOT PAY',
            style: GoogleFonts.josefinSans(
                fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          nextScreen: LandingPg(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
        ),
      ),
    );
  }
}

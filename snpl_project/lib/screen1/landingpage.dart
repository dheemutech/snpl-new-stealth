// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snpl_project/screen1/login.dart';

class LandingPg extends StatelessWidget {
  const LandingPg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3c80FF),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            Center(
                child: Image(
              image: AssetImage('scan.png'),
              height: size.height * 0.38,
            )),
            SizedBox(
              height: size.height * 0.1,
            ),
            Center(
              child: Text('SPOT PAY',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Colors.white)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  primary: Color(0xff000000),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.3,
                      vertical: size.height * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

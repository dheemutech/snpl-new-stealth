// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../screen2/id.dart';

class ViewPage2 extends StatefulWidget {
  const ViewPage2({Key? key}) : super(key: key);

  @override
  State<ViewPage2> createState() => _ViewPage2State();
}

class _ViewPage2State extends State<ViewPage2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff271D5F),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          IconButton(
            icon: Icon(Icons.close),
            iconSize: 40,
            color: Color(0xffFF9838),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
              width: size.width,
              child: Image(image: AssetImage('assets/VerifyEmail.png'))),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
              child: Text(
            'Verify your adhaar No',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          )),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              'Financial regulations require us to verify your ID. This helps prevent someone else from creating a account in your name',
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              'After this step, you’ll be ready to scan and pay',
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
          ),
          SizedBox(
            height: size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IDProof()));
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Color(0xff2C4D8D),
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                primary: Color(0xff38C1FF),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.34,
                    vertical: size.height * 0.02),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

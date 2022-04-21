// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'login.dart';

class FirstPg extends StatefulWidget {
  const FirstPg({Key? key}) : super(key: key);

  @override
  _FirstPgState createState() => _FirstPgState();
}

class _FirstPgState extends State<FirstPg> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4059ad),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'SNPL',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(phoneController)));
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
              primary: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.33,
                  vertical: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
        ],
      ),
    );
  }
}

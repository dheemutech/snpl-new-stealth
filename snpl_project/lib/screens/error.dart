// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:snpl_project/screens/homepage.dart';
import 'package:snpl_project/screens/loader.dart';
import 'package:snpl_project/screens/subTile.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) => isLoading
      ? Loader()
      : Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Image(
                image: AssetImage('fail.gif'),
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Failed',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              subtile(subTitleText: 'Your Paymaent got failed'),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Retry',
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
                    primary: Color(0xff9B4BFF),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.4,
                        vertical: MediaQuery.of(context).size.height * 0.02),
                  ),
                ),
              ),
            ],
          ),
        );
}

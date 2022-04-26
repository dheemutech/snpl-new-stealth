// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens3/homepage.dart';
import '../screens3/subTile.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key, required this.vpa, required this.value})
      : super(key: key);

  final String vpa;
  final String value;

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  void initState() {
    super.initState();
    ConfirmationPage(
      vpa: '',
      value: '',
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xff271D5F),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Image(
              image: AssetImage('success.gif'),
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Successfull',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white)),
            ),
            subtile(subTitleText: 'Your Paymaent was Done Successfully'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    color: Color(0xffD8D8D8),
                    border: Border.all(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'You Paid',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                " ${widget.vpa}",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                ),
                              ),
                              Spacer(),
                              Text(
                                " ${widget.value}",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Ok',
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
                      horizontal: MediaQuery.of(context).size.width * 0.4,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                ),
              ),
            ),
          ],
        ),
      );
}

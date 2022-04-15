// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:snpl_project/screens/view.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final phoneController = TextEditingController();
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 40,
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Enter the 7-digit code we texted to',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Text(
                '+xx xxxx xx88',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'This extra step shows its really you trying to',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Text(
                'sign in',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    maxLength: 7,
                    decoration: InputDecoration(
                        fillColor: Color(0xffffffff),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: '7-digit OTP',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xffC9C9C9))),
                  )),
              SizedBox(
                height: size.height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewPage()));
                  },
                  child: Text(
                    'Submit',
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
                        horizontal: size.width * 0.36,
                        vertical: size.height * 0.02),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'I need help',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    primary: Color(0xffffffff),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.32,
                        vertical: size.height * 0.02),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

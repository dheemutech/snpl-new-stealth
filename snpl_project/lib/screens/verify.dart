// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:snpl_project/screens/uplpic.dart';

class ConfirmPg extends StatefulWidget {
  const ConfirmPg({Key? key}) : super(key: key);

  @override
  State<ConfirmPg> createState() => _ConfirmPgState();
}

class _ConfirmPgState extends State<ConfirmPg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Enter the 7-digit code we texted to registered phone number.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "This extra step shows the entered ID is yours",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
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
          ),
          Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadPic()));
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
            SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );
  }
}

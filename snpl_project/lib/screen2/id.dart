// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:snpl_project/screens3/homepage.dart';

class IDProof extends StatefulWidget {
  const IDProof({Key? key}) : super(key: key);

  @override
  State<IDProof> createState() => _IDProofState();
}
class _IDProofState extends State<IDProof> {
  
  final adhaarcontroller = OtpFieldController();
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
            icon: Icon(Icons.close),
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
              "ID-proof",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Text(
              "ID number (Adhaar Number)",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: size.width - 10,
              child: OTPTextField(
                controller: adhaarcontroller,
                otpFieldStyle:
                    OtpFieldStyle(backgroundColor: Colors.transparent),
                length: 12,
                width: size.width * 0.1,
                fieldWidth: 15,
                style: TextStyle(fontSize: 20),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              //}
              },
              child: Text(
                'Start',
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
                    horizontal: size.width * 0.39,
                    vertical: size.height * 0.02),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}

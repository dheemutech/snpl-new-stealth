// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snpl_project/screens/homepage.dart';
import 'package:snpl_project/screens/view.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen(this.phone);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? enteredOTP = '';
  final _controller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String verificationIDRecieved = '';
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
                ' +91 ${widget.phone}',
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
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    maxLength: 7,
                    onChanged: (pin) {
                      enteredOTP = pin;
                    },
                    onSubmitted: (enteredOTP) async {
                      await _auth
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: verificationIDRecieved,
                              smsCode: enteredOTP))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewPage(widget.phone)));
                        }
                      });
                    },
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
                  onPressed: ()
                  async {
                    if (enteredOTP!.length < 8) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Invalid OTP'),
                            );
                          });
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewPage(widget.phone)));
                    }
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

  verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException exception) {},
      codeSent: (String verificationID, int? resendToken) {
        setState(() {
          verificationIDRecieved = verificationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          verificationIDRecieved = verificationID;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    verifyPhone();
  }
}

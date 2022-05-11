// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snpl_project/screen2/createacc.dart';

import '../screen3/homepage.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  final String pin;
  const OTPScreen(this.phone, this.pin);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String enteredOTP = '';
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
      backgroundColor: Color(0xff3c80FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 40,
                color: Color(0xff182825),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'Enter the 4-digit Pin',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter PIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                        alignment: Alignment.centerLeft,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(fontSize: 20, color: Color(0XFF3C80FF)),
                          maxLength: 4,
                          cursorColor: Color(0xff000000),
                          onChanged: (pin) {
                            enteredOTP = pin;
                          },
                          onSubmitted: (enteredOTP) async {
                            //print('==========================');
                            await _auth
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
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
                                        builder: (context) =>
                                            CreateAcc(widget.phone)));
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                              ),
                              hintText: 'XXXX',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xffC9C9C9))),
                        )),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (enteredOTP == widget.pin) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('Invalid PIN'),
                              );
                            });
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
                      primary: Color(0xff000000),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.3,
                          vertical: size.height * 0.02),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Future verifyPhone() async {
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
    // verifyPhone();
  }
}

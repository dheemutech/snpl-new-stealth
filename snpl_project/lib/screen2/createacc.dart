// ignore_for_file: prefer_const_constructors

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snpl_project/screens3/view2.dart';
import 'package:snpl_project/services/database.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc(this.phoneNumber, {Key? key}) : super(key: key);
  final String phoneNumber;

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

final _forKey = GlobalKey<FormState>();

class _CreateAccState extends State<CreateAcc> {
  String? enteredOTP = '';
  final nameController = TextEditingController();
  final pinController = TextEditingController();
  final pInController = TextEditingController();
  final emailController = TextEditingController();

  // final _auth = FirebaseAuth.instance;

  bool checkedValue = false;

  String verificationIDRecieved = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff271D5F),
      body: SingleChildScrollView(
        child: Form(
          key: _forKey,
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
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Create your account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'First Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                } else {
                                  return null;
                                }
                              },
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Color(0xff3D346F),
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
                                        color: Colors.white54, width: 2.0),
                                  ),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xffC9C9C9))),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter e-mail address';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Enter valid Email';
                                } else {
                                  return null;
                                }
                              },
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Color(0xff3D346F),
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
                                        color: Colors.white54, width: 2.0),
                                  ),
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xffC9C9C9))),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Setup pin',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextField(
                              controller: pinController,
                              keyboardType: TextInputType.number,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              maxLength: 6,
                              onChanged: (pin) {
                                enteredOTP = pin;
                              },
                              onSubmitted: (enteredOTP) async {
                                // await _auth
                                //     .signInWithCredential(
                                //         PhoneAuthProvider.credential(
                                //             verificationId:
                                //                 verificationIDRecieved,
                                //             smsCode: enteredOTP))
                                //     .then((value) async {
                                //   if (value.user != null) {
                                //     Navigator.pushAndRemoveUntil(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) => HomePage()),
                                //         (route) => false);
                                //   } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewPage2()));
                              },
                              //});
                              //},
                              decoration: InputDecoration(
                                  fillColor: Color(0xff3D346F),
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
                                        color: Colors.white54, width: 2.0),
                                  ),
                                  hintText: '4-digit Pin',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xffC9C9C9))),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Re-enter pin',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextField(
                              controller: pInController,
                              keyboardType: TextInputType.number,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              maxLength: 6,
                              onChanged: (pin) {
                                enteredOTP = pin;
                              },
                              decoration: InputDecoration(
                                  fillColor: Color(0xff3D346F),
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
                                        color: Colors.white54, width: 2.0),
                                  ),
                                  hintText: '4-digit Pin',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xffC9C9C9))),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                    width: 1.0, color: Colors.white60),
                              ),
                              value: checkedValue,
                              onChanged: (checkedValue) {
                                setState(() {
                                  this.checkedValue = checkedValue!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                'I certify that I am 18 years of age or older, and I agree to the User Agreement and Privacy Policy',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_forKey.currentState!.validate()) {
                            Database.addUser(
                                nameController.text,
                                emailController.text,
                                int.parse(widget.phoneNumber),
                                enteredOTP!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewPage2()));
                          }
                        },
                        child: Text(
                          'Submit',
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
                              horizontal: size.width * 0.36,
                              vertical: size.height * 0.02),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

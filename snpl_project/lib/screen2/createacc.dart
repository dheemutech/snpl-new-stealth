// ignore_for_file: prefer_const_constructors

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snpl_project/screen2/id.dart';
import 'package:snpl_project/services/database.dart';

import '../screen3/homepage.dart';
import '../screen3/view2.dart';

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

  final _auth = FirebaseAuth.instance;

  bool checkedValue = false;

  String verificationIDRecieved = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff3c80FF),
      body: SingleChildScrollView(
        child: Form(
          key: _forKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 40,
                  color: Color(0xff182825),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Center(
                    child: Text(
                      "Create your account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
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
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF3C80FF),
                            ),
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
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffC9C9C9))),
                          )),
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
                      Container(
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
                            style: TextStyle(
                                fontSize: 20, color: Color(0XFF3C80FF)),
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
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xffC9C9C9))),
                          )),
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
                      Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: pinController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 20, color: Color(0XFF3C80FF)),
                            maxLength: 4,
                            onChanged: (pin) {
                              enteredOTP = pin;
                            },
                            onSubmitted: (enteredOTP) async {
                              await _auth
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId:
                                              verificationIDRecieved,
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
                                          builder: (context) => ViewPage2()));
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
                      Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: pInController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 20, color: Color(0XFF3C80FF)),
                            maxLength: 4,
                            cursorColor: Color(0xff000000),
                            onChanged: (pin) {
                              enteredOTP = pin;
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
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_forKey.currentState!.validate()) {
                        Database.addUser(
                            nameController.text,
                            emailController.text,
                            int.parse(widget.phoneNumber),
                            enteredOTP!);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => IDProof()),
                            (route) => false);
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
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: unused_import, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snpl_project/screen1/pin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snpl_project/screen2/createacc.dart';
import '../services/database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
        backgroundColor: Color(0xff3c80FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          style: TextStyle(fontSize: 20, color: Color(0XFF3C80FF)),
                          maxLength: 10,
                          cursorColor: Color(0xff000000),
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter phone number';
                            } else if (value.length < 10 ||
                                int.tryParse(value) == null) {
                              return 'Enter valid phone number';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
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
                                  color: Color(0XFF000000), width: 2.0),
                            ),
                            hintText: 'Phone No.',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Color(0xff182825),
                            ),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color(0xffC9C9C9)),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool existingUser = await Database.userExists(
                          int.parse(phoneController.text));

                      if (existingUser) {
                        String pin = await Database.fetchPin();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                OTPScreen(phoneController.text, pin)));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CreateAcc(phoneController.text)));
                      }
                    }
                  },
                  child: Text(
                    'Sign In',
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
                        horizontal: size.width * 0.2,
                        vertical: size.height * 0.02),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

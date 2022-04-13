// ignore_for_file: unused_import, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:snpl_project/screens/otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(this.phoneController, {Key? key}) : super(key: key);
  final TextEditingController phoneController;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
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
                  height: size.height * 0.05,
                ),
                Text(
                  'Enter your mobile number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  'to get started',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: [
                    Text(
                      'you will recieve a ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Text(
                      'One Time Password',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
                Text(
                  'to this number',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: widget.phoneController,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      maxLength: 10,
                      // validator: (value) {
                      //   if (value == null) {
                      //     return 'Please enter phone number';
                      //   } else if (value.length < 10 ||
                      //       int.tryParse(value) == null) {
                      //     return 'Enter valid phone number';
                      //   } else {
                      //     return null;
                      //   }
                      // },
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
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          hintText: 'Phone No.',
                          prefixIcon: Icon(
                            Icons.call,
                            color: Color(0xff000000),
                          ),
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xffC9C9C9))),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPScreen()));
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
                      primary: Color(0xff9B4BFF),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.36,
                          vertical: size.height * 0.02),
                    ),
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

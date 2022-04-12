// ignore_for_file: unused_import, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

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

  // String? get _errorText {
  //   final text = _controller.value.text;
  //   if (text.isEmpty) {
  //     return 'Can\'t be empty';
  //   }
  //   if (text.length < 4) {
  //     return 'Too short';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: widget.phoneController,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      maxLength: 10,
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {},
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
    ));
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:snpl_project/screens3/homepage.dart';
import 'package:snpl_project/services/database.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc(this.phoneNumber, {Key? key}) : super(key: key);
  final String phoneNumber;

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

final _forKey = GlobalKey<FormState>();

class _CreateAccState extends State<CreateAcc> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _forKey,
        child: Padding(
          padding:  EdgeInsets.only(left: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Text(
              "Create your account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              'First Name',
              style: TextStyle(
                  color: Colors.black,
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
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                  color: Colors.black,
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
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xffC9C9C9))),
                  )),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Checkbox(
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
                      style: TextStyle(fontSize: 20),
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
                await Database.addUser(nameController.text, emailController.text, int.parse(widget.phoneNumber));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));
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
            SizedBox(
              height: size.height * 0.01,
            ),
          ]),
        ),
      ),
    );
  }
}

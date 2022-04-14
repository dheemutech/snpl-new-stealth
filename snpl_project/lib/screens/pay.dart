// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens/confirmation.dart';
import '../screens/error.dart';
import '../services/payment.dart';

class PayPage extends StatefulWidget {
  final String vpa;
  const PayPage({Key? key, required this.vpa}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Icon(
            Icons.person,
            size: size.height * 0.1,
            color: Colors.blue,
          ),
          Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(widget.vpa,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: size.height * 0.2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: size.width,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  color: Color(0xffD8D8D8),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'you are paying',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorHeight: 25,
                        controller: _controller,
                        style: TextStyle(fontSize: 25),
                        // onSubmitted: (String value) async {
                        //   await showDialog<void>(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return AlertDialog(
                        //         title: const Text('Thanks!'),
                        //         content: Text(
                        //             'You typed "$value", which has length ${value.characters.length}.'),
                        //         actions: <Widget>[
                        //           TextButton(
                        //             onPressed: () {
                        //               Navigator.pop(context);
                        //             },
                        //             child: const Text('OK'),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   );
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          //       //String id= await postPayment(widget.vpa, int.parse(textController.text));
          //       //if(complete== true){
          //       //navigate to conf}{push to firebase}{deduct value}else{error}
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Text(
                  'FROM HDFC a/c XX7383',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String id = await postPayment(
                        widget.vpa, int.parse(_controller.text));
                    if (id == 'error') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ErrorPage()),
                      );
                      return;
                    }

                    bool paymentStatus = await isPaymentComplete(id);
                    if (paymentStatus) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationPage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ErrorPage()),
                      );
                    }
                  },
                  child: Text(
                    "Pay",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

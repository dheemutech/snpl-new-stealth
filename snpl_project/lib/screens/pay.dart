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
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Text('You are paying to ' + widget.vpa,textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                  ),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: Colors.black,
                  ),
                  hintText: ('Enter Amount'),
                  hintStyle: TextStyle(color: Colors.black)),
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          ElevatedButton(onPressed:  () async {
            String id = await postPayment(widget.vpa, int.parse(textController.text));
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
                MaterialPageRoute(builder: (context) => ConfirmationPage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ErrorPage()),
              );
            }
          }, child: Text('Pay'))
        ],
      ),
    );
  }
}

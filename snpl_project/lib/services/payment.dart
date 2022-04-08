import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

String username = 'rzp_live_NOpH3RKc4daR0k';
String password = 'VeOXTlxUDDqlZFHTNUvo0oLj';
String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
String accNo = "4564569847888677";

Future<String> postPayment(String vpa, int amount) async {
  final res = await http.post(
    Uri.parse('https://api.razorpay.com/v1/payouts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: basicAuth,
    },
    body: jsonEncode(<String, Object>{
      "account_number": accNo,
      "amount": amount * 100,
      "currency": "INR",
      "mode": "UPI",
      "purpose": "refund",
      "fund_account": {
        "account_type": "vpa",
        "vpa": {"address": vpa},
        "contact": {
          "name": "Gaurav Kumar",
          "email": "gaurav.kumar@example.com",
          "contact": "9876543210",
          "type": "employee",
          "reference_id": "Acme Contact ID 12345",
          "notes": {
            "notes_key_1": "Tea, Earl Grey, Hot",
            "notes_key_2": "Tea, Earl Grey… decaf."
          }
        }
      },
      "queue_if_low_balance": true,
      "reference_id": "Acme Transaction ID 12345",
      "narration": "Acme Corp Fund Transfer",
      "notes": {"notes_key_1": "Beam me up Scotty", "notes_key_2": "Engage"}
    }),
  );

  String status =
      await isPaymentComplete(jsonDecode(res.body)['id']) ? 'done' : 'not done';
  print(status);

  if (res.statusCode != 200) return 'error';
  return jsonDecode(res.body)['id'];
}

Future<bool> isPaymentComplete(String id) async {
  String status = 'processing';
  int count = 0;

  while (status == 'processing') {
    if (status == 'processing') count += 1;

    final res = await http.get(
        Uri.parse('https://api.razorpay.com/v1/payouts/' + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: basicAuth,
        });

    dynamic body = jsonDecode(res.body);
    status = body['status'];
    if (count == 50) return false;
  }

  if (status == 'processed') return true;
  return false;
}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void postPayment(String vpa, int amount) async {
  String username = 'rzp_test_FTh24jW0UZksS6';
  String password = '0WMvpjJNIKBJsvQDoiOA6fV2';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  final res = await http.post(
    Uri.parse('https://api.razorpay.com/v1/payouts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:basicAuth,
    },
    body: jsonEncode(<String, Object>{
    "account_number":"2323230023050033",
    "amount":amount*100,
    "currency":"INR",
    "mode":"UPI",
    "purpose":"refund",
    "fund_account":{
        "account_type":"vpa",
        "vpa":{
            "address":vpa
        },
        "contact":{
            "name":"Gaurav Kumar",
            "email":"gaurav.kumar@example.com",
            "contact":"9876543210",
            "type":"employee",
            "reference_id":"Acme Contact ID 12345",
            "notes":{
                "notes_key_1":"Tea, Earl Grey, Hot",
                "notes_key_2":"Tea, Earl Grey… decaf."
            }
        }
    },
    "queue_if_low_balance":true,
    "reference_id":"Acme Transaction ID 12345",
    "narration":"Acme Corp Fund Transfer",
    "notes":{
        "notes_key_1":"Beam me up Scotty",
        "notes_key_2":"Engage"
    }
    }),
  );

  print(res.statusCode);
  print(res.body);
}
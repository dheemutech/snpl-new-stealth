//import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference _collectionReferenceUSER =
    _firebaseFirestore.collection("USER");
final CollectionReference _collectionReferenceTRANSACTION =
    _firebaseFirestore.collection("TRANSACTION");

class Database {
  static Stream<QuerySnapshot> readTransactions() {
    CollectionReference transactionCollection =
        _collectionReferenceTRANSACTION.doc().collection("TRANSACTIONS");
    return transactionCollection.snapshots();
  }

  static Future<void> postTransactions(String vpa, int payment, String userId) async {
    try {
      DocumentReference documentReference = _collectionReferenceTRANSACTION.doc();
      Map<String, dynamic> data = <String, dynamic>{
        "vpa": vpa,
        "payment": payment,
        "user_id": userId,
      };
      await documentReference.set(data);
    } catch (e) {
      print(e);
    }
  }

  // static Future<int> fetchCredit({required String userid})async{
  //   DocumentReference documentReference = _collectionReferenceUSER.doc(userid);
  //   return (await documentReference.get()).data()["credit_left"] as int;
  // }


  static Future<void> addUser(String name, String email, int phoneNumber) async {
    try {
      DocumentReference documentReference = _collectionReferenceUSER.doc();
      Map<String, dynamic> data = <String, dynamic>{
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        // "aadhar_number": aadharNumber,
        "credit_left": 1000, // default credit
      };
      await documentReference.set(data);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deductCredit(String userId, int amount) async {
    try {
      var docSnapshot = await _collectionReferenceUSER.doc(userId).get();
      if (docSnapshot.exists) {
       Map<String, dynamic> data = docSnapshot.data()! as Map<String, dynamic>;

        var prevCredit = data['credit_left'];
       _collectionReferenceUSER.doc(userId).update({'credit_left': prevCredit-amount});
      }
    } catch (e) {
      print(e);
    }
  }
}

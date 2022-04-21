//import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference _collectionReferenceUSER =
    _firebaseFirestore.collection("USER");
final CollectionReference _collectionReferenceTRANSACTION =
    _firebaseFirestore.collection("TRANSACTION");

class Database {
  // ignore: prefer_typing_uninitialized_variables
  static var currentUser;

  static bool userCheck() {
    return Database.currentUser != null;
  }

  static Future<bool> userExists(int phoneNumber) async {
    var docSnapshot = await _collectionReferenceUSER
        .where('phone_number', isEqualTo: phoneNumber)
        .get();
    if (docSnapshot.docs.isEmpty) return false;

    Database.currentUser = docSnapshot.docs[0];
    return true;
  }

  static Stream<QuerySnapshot> readTransactions() {
    CollectionReference transactionCollection =
        _collectionReferenceTRANSACTION.doc().collection("TRANSACTIONS");
    return transactionCollection.snapshots();
  }

  static Future<void> postTransactions(String vpa, int payment) async {
    try {
      DocumentReference documentReference =
          _collectionReferenceTRANSACTION.doc();
      Map<String, dynamic> data = <String, dynamic>{
        "vpa": vpa,
        "payment": payment,
        "user_id": Database.currentUser.id,
      };
      await documentReference.set(data);
    } catch (e) {
      print(e);
    }
  }

  static Future<String> fetchCredit() async {
    var docSnapshot =
        await _collectionReferenceUSER.doc(Database.currentUser.id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()! as Map<String, dynamic>;
      print(data["credit_left"]);
      return data["credit_left"].toString();
    }
    return "0";
  }

  static Future<void> addUser(
      String name, String email, int phoneNumber) async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        // "aadhar_number": aadharNumber,
        "credit_left": 1000, // default credit
      };

      Database.currentUser = await _collectionReferenceUSER.add(data);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deductCredit(int amount) async {
    try {
      var docSnapshot =
          await _collectionReferenceUSER.doc(Database.currentUser.id).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()! as Map<String, dynamic>;

        var prevCredit = data['credit_left'];
        _collectionReferenceUSER
            .doc(Database.currentUser.id)
            .update({'credit_left': prevCredit - amount});
      }
    } catch (e) {
      print(e);
    }
  }
}

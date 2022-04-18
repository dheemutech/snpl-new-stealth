//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  static Future<void> addUser(String name, String email, int number,
      int aadharNumber, int creditLeft) async {
    try {
      DocumentReference documentReference = _collectionReferenceUSER.doc();
      Map<String, dynamic> data = <String, dynamic>{
        "name": name,
        "email": email,
        "number": number,
        "aadhar_number": aadharNumber,
        "credit_left": creditLeft,
      };
      await documentReference.set(data);
    } catch (e) {
      print(e);
    }
  }
}

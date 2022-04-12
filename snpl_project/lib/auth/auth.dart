// // ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:snpl_project/auth/login.dart';
// import 'package:snpl_project/auth/user.dart';

// class AuthService {
//   final _auth = FirebaseAuth.instance;
//   final _db = Db();
//   String? sentCode;

//   UserModel? _mapUser(User? user) {
//     if (user == null) {
//       return null;
//     }
//     return UserModel(
//       uid: user.uid,
//       email: user.email,
//       phone: user.phoneNumber,
//     );
//   }

//   Stream<UserModel?>? get user => _auth.authStateChanges().map(_mapUser);

//   Future<UserModel?> signIn(String email, String password) async {
//     final creds = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return _mapUser(creds.user);
//   }

//   Future<UserModel?> signUp(
//       String email, String password, String name, String phone) async {
//     final creds = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     if (creds.user != null) {
//       _db.addUser(email, name, phone);
//     }
//     return _mapUser(creds.user);
//   }

//   logInWIthPhone({
//     required String phone,
//   }) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: '+91' + phone,
//       verificationCompleted: (PhoneAuthCredential cred) async {
//         await _auth.signInWithCredential(cred);
//         //await _db.addUser(_auth.currentUser!.uid, email, name, phone);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);
//       },
//       codeSent: (String verificationID, int? resendToken) {
//         sentCode = verificationID;
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//       timeout: Duration(seconds: 0),
//     );
//   }

//   verifyOtp(String enteredCode, BuildContext context) async {
//     final phoneController = TextEditingController();
//     try {
//       await _auth.signInWithCredential(PhoneAuthProvider.credential(
//         verificationId: sentCode!,
//         smsCode: enteredCode,
//       ));
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => LoginScreen(phoneController)));
//     } catch (e) {
//       print(e);
//       FocusScope.of(context).unfocus();
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text('Wrong Code, Please try again!'),
//             );
//           });
//     }
//   }

//   Future<void> signOut() async => await _auth.signOut();
// }

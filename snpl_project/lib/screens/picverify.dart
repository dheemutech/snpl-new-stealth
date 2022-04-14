// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:snpl_project/screens/homepage.dart';

// class PicUpl extends StatefulWidget {
//   const PicUpl({Key? key}) : super(key: key);

//   @override
//   State<PicUpl> createState() => _PicUplState();
// }

// class _PicUplState extends State<PicUpl> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: size.height * 0.1,
//           ),
//           SizedBox(
//               width: size.width,
//               child: Image(image: AssetImage('assets/Verified.png'))),
//           SizedBox(
//             height: size.height * 0.03,
//           ),
//           Center(
//             child: Text(
//               "You’re verified!",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//           ),
//           SizedBox(
//             height: size.height * 0.02,
//           ),
//           Text(
//             "Now you can scan and pay",
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 20,
//                 color: Colors.black54),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             child: ElevatedButton(
//               onPressed: () => Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => HomePage())),
//               child: Text(
//                 "Let's go",
//                 style: TextStyle(
//                   color: Color(0xffffffff),
//                   fontWeight: FontWeight.w800,
//                   fontSize: 25,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 elevation: 10,
//                 primary: Color(0xff9B4BFF),
//                 padding: EdgeInsets.symmetric(
//                     horizontal: size.width * 0.342,
//                     vertical: size.height * 0.02),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: size.height * 0.02,
//           ),
//         ],
//       ),
//     );
//   }
// }

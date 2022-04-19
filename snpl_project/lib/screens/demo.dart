import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart'; /


class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Firebase',
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('TRANSACTION').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Row(
                children: [
                Text(document['vpa']),
                const SizedBox(width: 50,),
                Text(document['payment'].toString()),
                ]

              );
            }).toList(),
          );
        },
      ),
    );
  }
}
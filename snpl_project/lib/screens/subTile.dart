

// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: camel_case_types
class subtile extends StatelessWidget {
  final String subTitleText;
  const subtile({
    Key? key,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: Text(
          subTitleText,
          style: TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Transaction  extends StatefulWidget {
  const Transaction ({ Key? key }) : super(key: key);

  @override
  State<Transaction > createState() => _TransactionState();
}

class _TransactionState extends State<Transaction > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
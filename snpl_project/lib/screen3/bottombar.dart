// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:snpl_project/screen3/about.dart';
import 'package:snpl_project/screen3/homepage.dart';
import 'package:snpl_project/screen3/scan.dart';
import 'package:snpl_project/screen3/setting.dart';
import 'package:snpl_project/screen3/transaction.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List pages = [HomePage(), Transaction(), Scan(), Setting(), About()];

  int currentIndex = 0;
  void OnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060427),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff060427),
        onTap: OnTap,
        currentIndex: currentIndex,
        selectedItemColor: Color(0XFF9B4BFF),
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_off_outlined),label: "Transaction"),
          BottomNavigationBarItem(
              icon: Icon(Icons.print_outlined),label: "Scan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_outline), label: "About"),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}

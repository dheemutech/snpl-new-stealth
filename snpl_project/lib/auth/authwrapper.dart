// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:snpl_project/auth/user.dart';
import 'package:snpl_project/screen1/firstpage.dart';

import '../screen3/bottombar.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _authState = Provider.of<UserModel?>(context);
    return _authState == null ? Loading() : BottomBar();
  }
}
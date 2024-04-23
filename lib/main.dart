import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollingmind_front/screens/login/login.dart';
import 'package:rollingmind_front/screens/signup/signup.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Color.fromRGBO(253, 146, 139, 1)),
      ),
    ),
    home: Login(),
  ));
}

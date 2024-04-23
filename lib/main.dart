import 'package:flutter/material.dart';
import 'package:rollingmind_front/screens/signup/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Color.fromRGBO(253, 146, 139, 1)),
        ),
      ),
      home: SignUp(),
    );
  }
}

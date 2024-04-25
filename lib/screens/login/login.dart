import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        toolbarHeight: 80,
        surfaceTintColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.black,
      ),
    );
  }
}

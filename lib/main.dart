import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollingmind_front/screens/login/login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();

  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Color.fromRGBO(253, 146, 139, 1)),
      ),
    ),
    home: Login(),
  ));
}

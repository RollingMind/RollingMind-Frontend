import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollingmind_front/screens/login/find_id.dart';
import 'package:rollingmind_front/screens/login/login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rollingmind_front/screens/signup/signup.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/find-id': (context) => FindId()
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Color.fromRGBO(253, 146, 139, 1)),
      )),
    );
  }
}

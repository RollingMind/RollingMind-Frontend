import 'package:flutter/material.dart';
import 'package:rollingmind_front/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/utils/colors.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();

  await initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '롤링마인드',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: AppColor.pink
        ),
        colorScheme: ColorScheme.fromSeed(
          primary: AppColor.pink,
          seedColor: AppColor.pink
        ),
        useMaterial3: true,
        fontFamily: "Inter",
      ),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
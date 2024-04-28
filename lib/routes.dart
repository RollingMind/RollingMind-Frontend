import 'package:get/get.dart';
import 'package:rollingmind_front/pages/auth/find_id_page.dart';
import 'package:rollingmind_front/pages/auth/login_page.dart';
import 'package:rollingmind_front/pages/auth/sign_up_page.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const login = "/";
  static const signup = "/sign_up";
  static const findId = "/find_id";
}

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => SignUpPage()),
    GetPage(name: AppRoutes.findId, page: () => FindIdPage())
  ];
}

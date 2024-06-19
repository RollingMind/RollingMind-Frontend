import 'package:get/get.dart';
import 'package:rollingmind_front/pages/auth/create_room_page.dart';
import 'package:rollingmind_front/pages/auth/find_id_page.dart';
import 'package:rollingmind_front/pages/auth/find_pw_page.dart';
import 'package:rollingmind_front/pages/auth/frie_paper_page.dart';
import 'package:rollingmind_front/pages/auth/home_page.dart';
import 'package:rollingmind_front/pages/auth/login_page.dart';
import 'package:rollingmind_front/pages/auth/participate_room_page.dart';
import 'package:rollingmind_front/pages/auth/room_page.dart';
import 'package:rollingmind_front/pages/auth/signup_page.dart';
import 'package:rollingmind_front/pages/auth/frie_paper_page.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const login = "/";
  static const signup = "/sign_up";
  static const findId = "/find_id";
  static const findPw = "/find_pw";
  static const home = "/home";
  static const createRoom = "/create_room";
  static const participateRoom = "/participate_room";
  static const hotrightnow = "/hotrightnow";
  static const room = "/room";
}

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => SignUpPage()),
    GetPage(name: AppRoutes.findId, page: () => FindIdPage()),
    GetPage(name: AppRoutes.findPw, page: () => FindPwPage()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.createRoom, page: () => CreateRoomPage()),
    GetPage(name: AppRoutes.participateRoom, page: ()=> ParticipateRoomPage()),
    GetPage(name: AppRoutes.hotrightnow, page: () => FirePaperPage()),
    GetPage(name: AppRoutes.room, page: () => RoomPage())
  ];
}

import 'package:flutter/material.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), 'Mypage', false, false, false),
    );
  }
}
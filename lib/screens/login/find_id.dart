import 'package:flutter/material.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class FindId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '아이디 찾기', true, false, false),
    );
  }
}

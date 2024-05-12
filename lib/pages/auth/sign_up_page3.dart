import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/widgets/membership_checkbox.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class SignUpPage3 extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: BaseAppBar(AppBar(), '회원가입', true, false, false),
    body: SingleChildScrollView(
      child: Container()
    ),
  );
 }
}
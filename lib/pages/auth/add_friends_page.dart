import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/apis/auth_api.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/utils/response.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/login_text_field_widget.dart';
import 'package:rollingmind_front/widgets/login_sns_button_widget.dart';

class AddFriendsPage extends StatelessWidget {
  const AddFriendsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text('add friends'),
      ),
    );
  }
}
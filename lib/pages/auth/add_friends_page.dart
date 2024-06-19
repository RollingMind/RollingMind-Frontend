import 'package:flutter/material.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class AddFriendsPage extends StatelessWidget {
  const AddFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(),'friends', false, false, false),
    );
  }
}
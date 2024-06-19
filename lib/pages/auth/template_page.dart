import 'package:flutter/material.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), 'templete', false, false, false),
    );
  }
}
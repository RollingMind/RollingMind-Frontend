import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';

class TextFieldArea extends StatelessWidget {
  final String labelText;
  final double left, top, right, bottom;
  final TextEditingController controller;

  const TextFieldArea({
    Key? key,
    required this.labelText,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: TextField(
        controller: controller,
        style: TextStyle(
          height: 2
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.lightGrey
            )
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 2),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: labelText,
          hintStyle: TextStyle(color: AppColor.darkGrey),
          labelStyle: TextStyle(
            color: AppColor.pink,
            fontSize: 15,
          ),
          prefix: Padding(
            padding: EdgeInsets.only(left: 11)
          )
        ),
      ),
    );
  }
}

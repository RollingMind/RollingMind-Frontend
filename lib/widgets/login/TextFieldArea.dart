import 'package:flutter/material.dart';
import 'package:rollingmind_front/utilities/colors.dart';

class TextFieldArea extends StatelessWidget {
  String labelText;
  double left, top, right, bottom;
  TextFieldArea(this.labelText, this.left, this.top, this.right, this.bottom,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: TextField(
        style: TextStyle(height: 2),
        decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: lightGrey)),
            contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 2),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            hintText: labelText,
            hintStyle: TextStyle(color: darkGrey),
            labelStyle: TextStyle(
              color: pink,
              fontSize: 15,
            ),
            prefix: Padding(padding: EdgeInsets.only(left: 11))),
      ),
    );
  }
}

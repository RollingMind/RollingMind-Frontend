import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';

class TextFieldState extends StatefulWidget {
  String helperText, errorText;

  TextFieldState(this.helperText, this.errorText);

  @override
  TextFieldWidget createState() => TextFieldWidget(helperText, errorText);
}

class TextFieldWidget extends State<TextFieldState> {
  TextEditingController editingController = TextEditingController();

  String helperText;
  String errorText;

  TextFieldWidget(this.helperText, this.errorText);

  String? checkErrorText() {
    if (editingController.text.isEmpty) return '빈칸입니다. 이메일을 입력해주세요.';
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 55),
        child: TextField(
          controller: editingController,
          decoration: InputDecoration(
            fillColor: AppColor.grey,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            helperText: helperText,
            helperStyle: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12, color: AppColor.green),
            errorText: checkErrorText(),
            contentPadding: EdgeInsets.all(16),
          ),
        ));
  }
}

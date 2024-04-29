import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';


class PasswordConfirmField extends StatefulWidget {
  final TextEditingController pwController;
  final TextEditingController pwConfirmController;

  const PasswordConfirmField({
    Key? key,
    required this.pwController,
    required this.pwConfirmController
  }) : super(key: key);

  @override
  _PasswordConfirmFieldState createState() => _PasswordConfirmFieldState(
    pwController: pwController,
    pwConfirmController: pwConfirmController
  );
}

class _PasswordConfirmFieldState extends State<PasswordConfirmField> {
  late final TextEditingController pwController;
  late final TextEditingController pwConfirmController;
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  _PasswordConfirmFieldState({
    Key? key,
    required this.pwController,
    required this.pwConfirmController
  });

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; 
      textFieldFocusNode.canRequestFocus = false;    
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        controller: pwConfirmController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never, 
          filled: true,
          fillColor: AppColor.grey01F0, 
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: EdgeInsets.all(8),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                _obscured
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 20,
              ),
            ),
          ),
        ),
        validator: (String? value) {
          if(value?.isEmpty ?? true) return '빈칸입니다. 비밀번호를 입력해주세요.';
          if(value != pwController.text) {
            return "비밀번호가 동일하지 않습니다.";
          }
        },
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';


class PasswordField extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  PasswordField({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState(formKey: formKey);
}

class _PasswordFieldState extends State<PasswordField> {
  final GlobalKey<FormState> formKey;
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  _PasswordFieldState({
    Key? key,
    required this.formKey
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
      child: Form(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscured,
          focusNode: textFieldFocusNode,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never, 
            filled: true,
            fillColor: AppColor.grey01F0, 
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
            ),
            contentPadding: EdgeInsets.all(10),
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
            if(!RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!%@#\$&*~]).{8,}$').hasMatch(value!)) {
              return "비밀번호 형식이 맞지 않습니다.";
            }
          },
        )
      )
    );
  }
}
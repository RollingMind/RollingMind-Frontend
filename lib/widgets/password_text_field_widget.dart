import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';


class PasswordField extends StatefulWidget {
  final TextEditingController pwController;
  final TextEditingController pwConfirmController;

  PasswordField({
    Key? key,
    required this.pwController,
    required this.pwConfirmController
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState(
    pwController: pwController,
    pwConfirmController: pwConfirmController
  );
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController pwController;
  final TextEditingController pwConfirmController;
  final textFieldFocusNode1 = FocusNode(), textFieldFocusNode2 = FocusNode();
  bool _obscured1 = true, _obscured2 = true;

  _PasswordFieldState({
    Key? key,
    required this.pwController,
    required this.pwConfirmController
  });

  void _toggleObscured1() {
    setState(() {
      _obscured1 = !_obscured1;
      if (textFieldFocusNode1.hasPrimaryFocus) return; 
      textFieldFocusNode1.canRequestFocus = false;    
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus) return; 
      textFieldFocusNode2.canRequestFocus = false;    
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 4),
            child: Text(
              '비밀번호',
              style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscured1,
            focusNode: textFieldFocusNode1,
            controller: pwController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never, 
              filled: true,
              fillColor: AppColor.grey01F0, 
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: GestureDetector(
                  onTap: _toggleObscured1,
                  child: Icon(
                    _obscured1
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
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 26, 0, 4),
            child: Text(
              '비밀번호 확인',
              style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscured2,
            focusNode: textFieldFocusNode2,
            controller: pwConfirmController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never, 
              filled: true,
              fillColor: AppColor.grey01F0, 
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: GestureDetector(
                  onTap: _toggleObscured2,
                  child: Icon(
                    _obscured2
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
        ]
      )
    );
  }
}
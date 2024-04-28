import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/password_text_field_widget.dart';
import 'package:rollingmind_front/widgets/stepper_count_widget.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class FindPwPage extends StatelessWidget {

  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  saveData() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '비밀번호 찾기', true, false, false),
      body: StepperState(
        formKeys: formKeys,
        marginTopControllerButton: 117.0,
        addContinueStepFunction: saveData,
        widgetList: [
          // Step 1
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '아이디를 입력해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                  ),
                ),
                const Text(
                  '회원가입 할 때 작성한 아이디를 입력해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColor.darkGrey8A
                  )
                ),
                const SizedBox(
                  height: 55,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 4),
                  child: Text(
                    '아이디',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: 325,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKeys[0],
                    child: TextFormField(
                      controller: _idController,
                      validator: (String? value) {
                        if(value?.isEmpty ?? true) {
                          return '빈칸입니다. 아이디를 입력해주세요.';
                        } else if (false) {
                          // TODO : 해당하는 아이디가 있는지 체크하는 API
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: AppColor.grey01F0,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    )
                  )
                )
              ]
            )
          ),
          // Step 2
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '반갑습니다!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'mypul1099',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColor.pink
                      ),
                    ),
                    Text(
                      '님!',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                    )
                  ],
                ),
                const Text(
                  '앱로그인에 사용할 새로운 비밀번호를 입력해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColor.darkGrey8A
                  )
                ),
                const SizedBox(
                  height: 56,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 4),
                  child: Text(
                    '비밀번호',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                PasswordField(formKey: formKeys[1])
              ]
            )
          )
        ]
      )
    );
  }
}
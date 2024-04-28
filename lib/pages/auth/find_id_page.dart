import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/stepper_count_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class FindIdPage extends StatelessWidget {

  final _controller = TextEditingController();

  saveData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', _controller.text);
    debugPrint("${_controller.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '아이디 찾기', true, false, false),
      body: StepperState(
        formKeys: formKeys,
        marginTopControllerButton: 190.0,
        addContinueStepFunction: saveData,
        widgetList: [
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '이메일을 입력해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                  ),
                ),
                const Text(
                  '회원가입 할 때 사용된 이메일을 입력해주세요.',
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
                    '이메일',
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
                      controller: _controller,
                      validator: (String? value) {
                        if(value?.isEmpty ?? true) {
                          return '빈칸입니다. 이메일을 입력해주세요.';
                        } else if(!isEmail(value!)) { 
                          return '이메일을 확인해주세요.';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: AppColor.grey01F0,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        helperText: '*입력하신 이메일은 본인 확인의 용도 외에는\n사용되지 않습니다.',
                        helperStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColor.green
                        ),
                        contentPadding: EdgeInsets.all(13),
                      ),
                    )
                  )
                )
              ]
            )
          ),
          Container(
            child:Text('sdfjklsd')
          )
        ]
      ),
    );
  }
}

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

  final _emailController = TextEditingController();
  final _authenticationController = TextEditingController();

  saveData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', _emailController.text);
    debugPrint("${_emailController.text}");
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
                      controller: _emailController,
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
                        contentPadding: EdgeInsets.all(10),
                      ),
                    )
                  )
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '인증번호를 입력해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                  ),
                ),
                const Text(
                  '입력하신 이메일로 인증번호를 발송하였습니다.',
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
                    '인증번호',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 220,
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: formKeys[1],
                        child: TextFormField(
                          controller: _authenticationController,
                          validator: (String? value) {},
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
                    ),
                    GestureDetector(
                      onTap: () async {
                        //TODO : 재발송하는 API 연결
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 85,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                              disabledBackgroundColor: AppColor.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              '재발송',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.white
                              ),
                            )
                          )
                        )
                      )
                    )
                  ]
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  '*인증번호가 발송되지 않았을 때에는 재발송버튼\n혹은 이메일을 재확인 해주시길 바랍니다.',
                  style: TextStyle(
                    color: AppColor.darkGrey8A,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '인증이 완료되었습니다!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Row(
                  children: [
                    Text(
                      '회원님의 아이디는 ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColor.darkGrey8A
                      )
                    ),
                    Text(
                      'mypul1099',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColor.pink,
                      )
                    ),
                    Text(
                      ' 입니다.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColor.darkGrey8A
                      )
                    )
                  ],
                ),
                const Text(
                  '로그인 화면으로 이동해 로그인을 진행해주세요',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColor.darkGrey8A
                  )
                ),
                const SizedBox(
                  height: 130
                )
              ]
            )
          )
        ]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/password_text_field_widget.dart';
import 'package:rollingmind_front/widgets/signup_checkbox_widget.dart';
import 'package:rollingmind_front/widgets/stepper_count_widget.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class SignUpPage extends StatelessWidget {
  final CheckController checkController = Get.put(CheckController());
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  final _pwConfirmController = TextEditingController();
  var idCheck = false;
  
  void saveData() {
    debugPrint("${checkController.isChecked}");
    debugPrint("${checkController.isChecked[1]}");
    debugPrint("${checkController.isChecked[2]}");
    if (StepperWidget.currentStep == 0 && (!checkController.isChecked[1] || !checkController.isChecked[2])) {
      // 필수 체크박스가 체크되지 않았을 경우
      Get.snackbar(
        '경고',
        '필수 약관에 동의해주세요.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      StepperWidget.currentStep = -1;
    }

    else if(StepperWidget.currentStep == 1 && idCheck) {
      debugPrint("${_idController.text}");
      debugPrint("${_pwController.text}");
    }

    else if (StepperWidget.currentStep == 1 && !idCheck) {
      // 아이디 중복 확인을 하지 않을 경우
      Get.snackbar(
        '경고',
        '아이디 중복 확인이 필요합니다.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      StepperWidget.currentStep -= 1;
    }
  }

  double marginTopValue() {
    if (StepperWidget.currentStep == 0)
      return 63.0;
    else if (StepperWidget.currentStep == 1)
      return 66.0;
    else if (StepperWidget.currentStep == 2)
      return 130.0;
    else if (StepperWidget.currentStep == 3)
      return 190.0;
    else
      return 289.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '회원가입', true, false, false),
      body: StepperState(
        formKeys: formKeys,
        marginTopControllerButton: marginTopValue,
        addContinueStepFunction: saveData,
        widgetList: [
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '환영합니다!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 20
                  ),
                ),
                const Text(
                  '롤링마인드와 특별한 추억을 만들어나가요!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColor.darkGrey8A
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CheckBoxs(
                  formKey: formKeys[0]
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '아이디와 비밀번호를\n입력해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 20
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKeys[1],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 4),
                            child: Text(
                              '아이디',
                              style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded( 
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: _idController,
                                validator: (String? value) {
                                  if(value?.isEmpty ?? true) {
                                    return '빈칸입니다. 사용할 아이디를 입력해주세요.';
                                  }
                                },
                                onFieldSubmitted: (String value) {
                                  debugPrint("${value}");
                                },
                                onChanged: (String value) {
                                  idCheck = false;
                                  debugPrint("${value} + ${idCheck}");
                                },
                                decoration: InputDecoration(
                                  fillColor: AppColor.grey01F0,
                                  filled: true,
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
                                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 9),
                                ),
                              )
                            ),
                            const SizedBox(
                              width: 16
                            ),
                            SizedBox(
                              width: 110,
                              child: Container(
                                margin: EdgeInsets.only(right: 23),
                                child: ElevatedButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    side: BorderSide(color: AppColor.grey01F0),
                                    backgroundColor: AppColor.grey01F0,
                                    padding: EdgeInsets.all(14)
                                  ),
                                  onPressed: () {
                                    if(_idController.text.isEmpty) return;
                                    idCheck = true;
                                    // TODO: 사용 가능한 지 확인하는 API 불러오기
                                    Get.snackbar(
                                      '확인',
                                      '사용할 수 있는 아이디입니다.',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '중복확인',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.darkGrey49,
                                          fontSize: 14
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              )
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 23
                        ),
                        PasswordField(
                          pwController: _pwController,
                          pwConfirmController: _pwConfirmController
                        )
                      ]
                    )
                  ),
                ),
              ]
            ),
          ),
          Container(

          )
        ],
      ),
    );
  }
}

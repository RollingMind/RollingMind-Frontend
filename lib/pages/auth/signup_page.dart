import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/signup_checkbox_widget.dart';
import 'package:rollingmind_front/widgets/stepper_count_widget.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class SignUpPage extends StatelessWidget {
  final CheckController checkController = Get.put(CheckController());

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
            alignment: Alignment.centerLeft,
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
                SizedBox(
                  height: 40,
                ),
                CheckBoxs(formKey: formKeys[0]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              ]
            ),
          )
        ],
      ),
    );
  }
}

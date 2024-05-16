import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/pages/auth/login_page.dart';
import 'package:rollingmind_front/utils/colors.dart';

class StepperState extends StatefulWidget {
  final List<Widget> widgetList;
  final double Function()? marginTopControllerButton;
  final Function addContinueStepFunction;
  List<GlobalKey<FormState>> formKeys = [];

  StepperState({
    Key? key,
    required this.formKeys,
    required this.marginTopControllerButton,
    required this.widgetList,
    required this.addContinueStepFunction
  }): super(key: key);

  @override
  StepperWidget createState() => StepperWidget(
    formKeys: formKeys,
    marginTopControllerButton: marginTopControllerButton,
    widgetList: widgetList,
    addContinueStepFunction: addContinueStepFunction
  );
}

class StepperWidget extends State<StepperState> {
  final List<Widget> widgetList;
  final double Function()? marginTopControllerButton;
  final Function addContinueStepFunction;
  static int currentStep = 0;
  bool isActiveBack = false, isActiveNext = true, isFinally = false;

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  @override
  void initState() {
    currentStep = 0;
    isActiveBack = false;
    isActiveNext = true;
    isFinally = false;
    super.initState();
  }

  StepperWidget({
    Key? key,
    required this.formKeys,
    required this.marginTopControllerButton,
    required this.widgetList,
    required this.addContinueStepFunction
  });

  init() {
    isActiveBack = true;
    isActiveNext = true;
    isFinally = false;
  }

  // 다음 버튼을 누를 때
  continueStep() {
    init();

    // 유효성 검사
    setState(() {
      if (currentStep < widgetList.length - 1 &&
          !(formKeys[currentStep].currentState?.validate() ?? false)) {
        isActiveBack = false;
        currentStep = 0;
      } else {
        addContinueStepFunction();
        currentStep += 1;
        if(currentStep == 0) {
          init();
          isActiveBack = false;
        }
      }
    });

    if (currentStep >= widgetList.length - 1) isFinally = true;
  }

  // 이전 버튼을 누를 때
  cancelStep() {
    init();

    if (currentStep > 0) {
      setState(() {
        currentStep -= 1;
      });
    }

    if (currentStep == 0) isActiveBack = false;
  }

  // 텝으로 이동 시
  onStepTapped(int value) {
    init();

    setState(() {
      // 현재 탭보다 더 큰 수의 탭으로 이동 불가 (큰 수의 탭은 무조건 다음 버튼으로만 이동 가능)
      if (currentStep < value) {
        if (currentStep == 0) isActiveBack = false;
        return;
      }

      currentStep = value;
      if (currentStep == 0) isActiveBack = false;
      if (currentStep >= widgetList.length - 1) isFinally = true;
    });
  }

  // 컨트롤 버튼 추가
  Widget controlsBuilder(context, details) {
    final double marginTopValue = marginTopControllerButton!();

    return Padding(
      padding: EdgeInsets.only(top: marginTopValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isFinally)
            _buildButton(
              '로그인', () => Get.offAll(LoginPage()), AppColor.pink, 306, 0)
          else if (isActiveBack)
            _buildButton('이전', details.onStepCancel, Colors.white, 110, 108),
          if (isActiveNext && !isFinally)
            _buildButton('다음', details.onStepContinue, AppColor.pink, 110,
              (currentStep == 0) ? 234 : 16),
        ],
      )
    );
  }

  // 컨트롤 버튼 UI
  Widget _buildButton(String text, VoidCallback onPressed, Color buttonColor,
      double width, double left) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: 42,
        margin: EdgeInsets.fromLTRB(left, 0, 0, 222),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(color: AppColor.pink),
            backgroundColor: buttonColor,
            foregroundColor:
                (buttonColor == Colors.white) ? AppColor.pink : Colors.white,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (text == "이전") _buildPreviousButton(),
              if (text == "다음") _buildNextButton(),
              if (text != "이전" && text != "다음") Text(text),
            ],
          ),
        ),
      ),
    );
  }

  // 이전 버튼 UI
  Widget _buildPreviousButton() {
    return Row(children: [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Image(
          image: AssetImage("assets/mingcute_left-line.png"),
          width: 18,
          height: 18,
        ),
      ),
      Text("이전", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
    ]);
  }

  // 다음 버튼 UI
  Widget _buildNextButton() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text("다음",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        ),
        Image(
          image: AssetImage("assets/mingcute_right-line.png"),
          width: 18,
          height: 18,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: currentStep,
      onStepContinue: continueStep,
      onStepCancel: cancelStep,
      onStepTapped: onStepTapped,
      controlsBuilder: controlsBuilder,
      elevation: 0,
      physics: NeverScrollableScrollPhysics(),
      steps: [
        for (int i = 0; i < widgetList.length; i++)
          Step(
            title: Text(''),
            content: Column(children: [widgetList[i]]),
            isActive: currentStep == i
          ),
      ]
    );
  }
}

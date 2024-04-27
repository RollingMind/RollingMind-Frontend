import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';

class StepperState extends StatefulWidget {
  List<Widget> widgetList;

  StepperState(this.widgetList);

  @override
  StepperWidget createState() => StepperWidget(widgetList);
}

class StepperWidget extends State<StepperState> {
  List<Widget> widgetList;
  int currentStep = 0;
  bool isActiveBack = false, isActiveNext = true, isFinally = false;

  init() {
    isActiveBack = true;
    isActiveNext = true;
    isFinally = false;
  }

  StepperWidget(this.widgetList);

  continueStep() {
    init();
    if (currentStep < widgetList.length - 1) {
      setState(() {
        currentStep += 1;
      });
    }
    if (currentStep >= widgetList.length - 1) isFinally = true;
  }

  cancelStep() {
    init();
    if (currentStep > 0) {
      setState(() {
        currentStep -= 1;
      });
    }
    if (currentStep == 0) isActiveBack = false;
  }

  onStepTapped(int value) {
    init();
    setState(() {
      currentStep = value;
      if (currentStep == 0) isActiveBack = false;
      if (currentStep >= widgetList.length - 1) isFinally = true;
    });
  }

  Widget controlsBuilder(context, details) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bottomMargin = screenHeight - 230;

    return Container(
      height: bottomMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isFinally)
            _buildButton(
                '로그인', () => Navigator.pushNamed(context, "/"), AppColor.pink, 306, 0)
          else if (isActiveBack)
            _buildButton('이전', details.onStepCancel, Colors.white, 110, 108),
          if (isActiveNext && !isFinally)
            _buildButton('다음', details.onStepContinue, AppColor.pink, 110,
                (currentStep == 0) ? 234 : 16),
        ],
      ),
    );
  }

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
            foregroundColor: buttonColor == Colors.white ? AppColor.pink : Colors.white,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
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
                isActive: currentStep >= i)
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/widgets/stepper_count_widget.dart';

class CheckController extends GetxController {
  // 상태를 관리하는 리스트, RxList로 선언
  var isChecked = List<bool>.generate(4, (_) => false).obs;

  // 체크박스 상태 업데이트 메소드
  void updateCheckState(int index) {
    if (index == 0) {
      bool isAllChecked = !isChecked.every((element) => element);
      isChecked.value = List.generate(4, (index) => isAllChecked);
    } else {
      isChecked[index] = !isChecked[index];
      isChecked[0] = isChecked.getRange(1, 4).every((element) => element);
    }
  }
}

class CheckBoxs extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  CheckBoxs({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckController checkController = Get.find<CheckController>();

    return Form(
      key: formKey,
      child: Obx(() => Column(children: _renderCheckList(checkController))), 
    );
  }

  List<Widget> _renderCheckList(CheckController checkController) {
    List<String> labels = [
      '전체 약관 동의',
      '[필수] 개인정보 수집 및 이용동의',
      '[필수] 이용약관 동의',
      '[선택] 이벤트성 정보 수신 동의',
    ];

    List<Widget> list = [
      renderContainer(checkController, 0, labels[0]),
      const Divider(thickness: 1.0, color: AppColor.grey02D9, height: 36),
    ];

    list.addAll(List.generate(
        3,
        (index) => renderContainer(checkController, index + 1, labels[index + 1])));
    return list;
  }

  Widget renderContainer(CheckController checkController, int index, String text) {
    return GestureDetector(
      onTap: () => checkController.updateCheckState(index),
      child: Container(
        padding: EdgeInsets.only(top: ((index == 0) ? 0 : 18.0), bottom: 18.0),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColor.pink, width: 1.0),
                color: checkController.isChecked[index] ? AppColor.pink : Colors.white,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 24),
            Text(text,
              style: const TextStyle(
                color: AppColor.darkGrey49, fontSize: 15
              )
            ),
          ],
        ),
      ),
    );
  }
}

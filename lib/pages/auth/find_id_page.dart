import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/stepper_count_widget.dart';

class FindIdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '아이디 찾기', true, false, false),
      body: StepperState([
        Container(
            margin: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '이메일을 입력해주세요.',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text('회원가입 할 때 지정된 이메일을 입력해주세요.',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                Container(
                    margin: EdgeInsets.only(top: 55),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: AppColor.lightGrey,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        helperText: '*입력하신 이메일은 본인 확인의 용도 외에는\n사용되지 않습니다.',
                        helperStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.green),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    )),
              ],
            )),
        Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [],
            ))
      ]),
    );
  }
}

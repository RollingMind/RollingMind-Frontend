import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/widgets/membership_checkbox.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '회원가입', true, false, false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(46),
              child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '환영합니다!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '롤링마인드와 특별한 추억을 만들어나가요!',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(138, 138, 138, 1)),
                      ),
                    ],
                  )),
            ),
            MembershipCheckbox(),
            Padding(
              padding: const EdgeInsets.all(46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(253, 146, 139, 1),
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.only(
                            left: 31.0, right: 26.0, )),
                    onPressed: () {

                    },
                    child: Container(
                      height: 42,
                      child: Row(
                      children: [
                        //if ch1, ch2가 값을 return 받았다면
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text("다음",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900, color: Color.fromRGBO(255, 255, 255, 1))),
                        ),
                        Image(
                          image: AssetImage("assets/mingcute_right-line.png"),
                          width: 18,
                          height: 18,
                        ),
                        //아니라면
                      ],
                    ),
                    ), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

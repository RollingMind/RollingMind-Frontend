import 'package:flutter/material.dart';
import 'package:rollingmind_front/utilities/colors.dart';
import 'package:rollingmind_front/widgets/BaseAppBar.dart';
import 'package:rollingmind_front/widgets/TextFieldArea.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(AppBar(), '로그인', false, false, false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
                  '어서오세요!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                margin: const EdgeInsets.fromLTRB(46, 46, 0, 10)),
            Container(
              child: Text(
                '롤링마인드는 로그인이 필요한 서비스 입니다.',
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14, color: darkGrey),
              ),
              margin: const EdgeInsets.only(left: 46),
            ),
            TextFieldArea('아이디', 35, 79, 35, 0),
            TextFieldArea('비밀번호', 35, 35, 35, 0),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 35),
                child: SizedBox(
                    width: 260,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        '로그인',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(pink)),
                    )))
          ],
        ));
  }
}

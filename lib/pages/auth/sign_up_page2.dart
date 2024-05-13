import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/widgets/membership_checkbox.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class SignUpPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isObscure = true; // 비밀번호 보이기/숨기기 상태를 관리할 변수

    return Scaffold(
      appBar: BaseAppBar(AppBar(), '회원가입', true, false, false),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(46.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 46.0),
                  child: Text('아이디와 비밀번호를 \n입력해주세요',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              Container(
                  margin: EdgeInsets.only(bottom: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('아이디', style: TextStyle(fontSize: 14)),
                            Row(
                              children: [
                                //input
                                SizedBox(
                                  height: 38,
                                  width: 213,
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    obscureText:
                                        false, // 아이디는 비밀번호가 아니므로 false로 설정
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10.0), // 내부 패딩 설정
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(240, 240, 240, 100),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {}, child: Text('중복확인'))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('비밀번호', style: TextStyle(fontSize: 14)),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10.0), // 테두리를 둥글게 만드는 설정
                                color: Color.fromRGBO(
                                    240, 240, 240, 100), // 배경색 설정
                              ),
                              margin: EdgeInsets.only(bottom: 24),
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                height: 38,
                                width: 296,
                                child: TextField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText:
                                      true, // 아이디는 비밀번호가 아니므로 false로 설정
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 10.0), // 내부 패딩 설정
                                    suffixIcon: IconButton(
                                      icon: Image.asset(
                                          'assets/eye-hide-line.png'),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('비밀번호 확인', style: TextStyle(fontSize: 14)),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10.0), // 테두리를 둥글게 만드는 설정
                                color: Color.fromRGBO(
                                    240, 240, 240, 100), // 배경색 설정
                              ),
                              margin: EdgeInsets.only(bottom: 24),
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                height: 38,
                                width: 296,
                                child: TextField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText:
                                      true, // 아이디는 비밀번호가 아니므로 false로 설정
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 10.0), // 내부 패딩 설정
                                    suffixIcon: IconButton(
                                      icon: Image.asset(
                                          'assets/eye-hide-line.png'),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                      SizedBox(height: 66),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //이전
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Color.fromRGBO(253, 146, 139, 1),
                                    width: 2), // 테두리를 핑크색으로 지정
                              ),
                              padding: EdgeInsets.only(left: 31.0, right: 26.0),
                            ),
                            onPressed: () => Get.to(SignUpPage2()),
                            child: Container(
                              height: 42,
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/mingcute_left-line-pink.png"),
                                    width: 18,
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "이전",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(253, 146, 139,
                                            1), // 텍스트 색상을 흰색으로 지정
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          //다음
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(253, 146, 139, 1),
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.only(
                                  left: 31.0,
                                  right: 26.0,
                                )),
                            onPressed: () => Get.to(SignUpPage2()),
                            child: Container(
                              height: 42,
                              child: Row(
                                children: [
                                  //if ch1, ch2가 값을 return 받았다면
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text("다음",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1))),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        "assets/mingcute_right-line.png"),
                                    width: 18,
                                    height: 18,
                                  ),
                                  //아니라면
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

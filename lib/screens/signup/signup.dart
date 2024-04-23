import 'package:flutter/material.dart';
import 'package:rollingmind_front/screens/signup/membership_checkbox.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Text(
            '회원가입',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.only(left: 25.0),
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
                        fontSize: 14, color: Color.fromRGBO(138, 138, 138, 1)),
                  ),
                ],
              )),
          MembershipCheckbox(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(253, 146, 139, 1),
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.only(left: 30.0, right: 30.0)),
            onPressed: () {},
            child: Text(
              '다음',
              style: TextStyle(color: Colors.white), // 텍스트 색상 지정
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SnsButton extends StatelessWidget {
  String type;
  double topValue;

  SnsButton(this.type, this.topValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: topValue),
        child: SizedBox(
            width: 320,
            height: 55,
            child: ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color((type == "kakao") ? 0xffFDE500 : 0xffF5F5F5)),
                  padding: MaterialStatePropertyAll(EdgeInsets.only(left: 71))),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/${type}.png'),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        (type == "kakao") ? '카카오톡 간편 로그인' : '구글 간편 로그인',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
            )));
  }
}

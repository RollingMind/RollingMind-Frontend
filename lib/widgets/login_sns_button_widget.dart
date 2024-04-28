import 'package:flutter/material.dart';
import 'package:rollingmind_front/utils/colors.dart';

class SnsButton extends StatelessWidget {
  final String type;

  const SnsButton({
    Key? key,
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 320,
        height: 55,
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: (type == 'kakao') ? AppColor.yellow : AppColor.lightGreyF5,
            padding: (
              EdgeInsets.only(left: (type == "kakao") ? 71 : 86)
            )
          ),
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
                )
              )
            ],
          ),
        )
      )
    );
  }
}

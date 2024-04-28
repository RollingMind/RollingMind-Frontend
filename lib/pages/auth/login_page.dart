import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/apis/auth_api.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/utils/response.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/login_text_field_widget.dart';
import 'package:rollingmind_front/widgets/sns_button_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '로그인', false, false, false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '어서오세요!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '롤링마인드는 로그인이 필요한 서비스 입니다.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColor.darkGrey8A
                ),
              ),
              TextFieldArea(
                labelText: '아이디',
                left: 0,
                top: 63,
                right: 10,
                bottom: 0,
                controller: _idController
              ),
              TextFieldArea(
                labelText: '비밀번호',
                left: 0,
                top: 35,
                right: 10,
                bottom: 0,
                controller: _pwController
              ),
              const SizedBox(
                height: 35
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    CustomResponse response = await AuthAPI()
                        .login(_idController.text, _pwController.text);

                    if(!context.mounted) return;
                    if(!response.isSuccess) {
                      Get.snackbar("로그인 실패", response.message);
                      return;
                    }

                    // Get.toNamed("/home");
                  },
                  child: SizedBox(
                  width: 260,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: AppColor.pink,
                    ),
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  )
                ),
                )
              ),
              const SizedBox(
                height: 10
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                TextButton(
                  onPressed: () => Get.toNamed("/find_id"),
                  child: Text(
                    '아이디 찾기',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.darkGrey8A
                    ),
                  )
                ),
                const Text(
                  "|",
                  style: TextStyle(
                    color: AppColor.grey02D9,
                    fontSize: 14
                  )
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '비밀번호 찾기',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.darkGrey8A
                    ),
                  )
                ),
                const Text(
                  "|",
                  style: TextStyle(
                    color: AppColor.grey02D9,
                    fontSize: 14
                  )
                ),
                TextButton(
                  onPressed: () => Get.toNamed("/sign_up"),
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColor.darkGrey8A
                    ),
                  )
                ),
                ]
              ),
              const SizedBox(
                height: 40
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/bubble.png'),
                  width: 150,
                )
              ),
              const SizedBox(
                height: 3
              ),
              SnsButton(
                type: 'kakao'
              ),
              const SizedBox(
                height: 20
              ),
              SnsButton(
                type: 'google'
              )
            ]
          ),
        ),
      ), 
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class ParticipateRoomPage extends StatefulWidget {
  const ParticipateRoomPage({super.key});

  @override
  _ParticipateRoomPage createState() => _ParticipateRoomPage();
}

class _ParticipateRoomPage extends State<ParticipateRoomPage> {
  final participationCount = 700;
  final String nickname = '여름이 지나간 계절';
  final String title = '지연이 생일 축하 해주세요 국민 여러분.';
  final content =
      '여러분 일년에 한 번 뿐인 이지연의 생일입니다. 인플루엔자가 되고싶은 이지연의 소원을 위해 모두들 한 번씩 쓰고 가주시길 부탁 드리옵나이다. 굳이 장문? 필요없습니다. 똥테러? 괜찮습니다. 머릿수만 많으면 다 좋다 이겁니다. 여러분의 힘이 필요합니다ㅠㅠㅠsdf';

  @override
  Widget build(BuildContext context) {
    String trimmedNickname =
        nickname.length > 8 ? '${nickname.substring(0, 7)}...' : nickname;
    String trimmedContent =
        content.length > 140 ? '${content.substring(0, 140)}...' : content;

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      appBar: BaseAppBar(AppBar(), '롤링 마인드 참여하기', true, false, true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetSearch(), // 검색 위젯 추가
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Text('지금 핫한 롤링페이퍼 🔥 ',
                        style: TextStyle(
                            color: Color(0xFFFD928B),
                            fontWeight: FontWeight.w800,
                            fontSize: 18)),
                  ),
                  Container(
                      margin: EdgeInsets.all(16), // 여백 설정
                      decoration: BoxDecoration(
                        color: Colors.white, // 배경색 설정
                        borderRadius: BorderRadius.circular(10), // 모서리 둥글기 설정
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(16),
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.amber,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset('assets/bubble.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              //제목과 게시자, 참여자
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13)),
                                Row(
                                  children: [
                                    Text(trimmedNickname,
                                        style: TextStyle(
                                            color: Colors.nicknamepink,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11)),
                                    Text('게시 | ',
                                        style: TextStyle(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 11)),
                                    Text('$participationCount 참여중',
                                        style: TextStyle(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/setting.png',
                                    width: 3, height: 15))
                          ],
                        ),
                        Container(height: 1, color: Colors.grey[200]),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 16, top: 16, left: 15, right: 15),
                          child: Text(
                            trimmedContent,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: ButtonBar(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 170,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFFD9D9D9),
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
                        child: Text('친구 공개',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)))),
                Spacer(),
                Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 170,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFFFD928B),
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: 330,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.white, // 다이얼로그 내부 배경색을 흰색으로 설정
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(23),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text('참여 하실 방의 초대코드를 입력해주세요', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                                      SizedBox(height: 16),
                                      Container(
                                        width: 284,
                                        height: 62,
                                        child: TextField(
                                          textAlign: TextAlign.start,
                                          cursorColor: Colors.grey,
                                          decoration: InputDecoration(
                                            fillColor: Color(0xFFD9D9D9), // 입력창 배경색을 회색으로 설정
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none, // 테두리 없애기
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text('참여하기',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18))))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetSearch extends StatelessWidget {
  //검색 위젯
  WidgetSearch({Key? key}) : super(key: key);
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Center(
        child: CupertinoSearchTextField(
          controller: _textController,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          placeholder: '제목을 입력하세요',
        ),
      ),
    );
  }
}

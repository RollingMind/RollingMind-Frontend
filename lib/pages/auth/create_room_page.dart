import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/pages/auth/room_page.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/sheet_widget.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({super.key});

  @override
  _CreateRoomPage createState() => _CreateRoomPage();
}

class _CreateRoomPage extends State<CreateRoomPage> {
  int _selectedopen = 0;
  int _selectedrequest = 0;
  bool release_date = false;
  int code = 0;
  @override
  Widget build(BuildContext context) {
    final colorNotifier = ColorProvider.of(context)!.colorNotifier;
    final initialColor = Color.fromRGBO(253, 146, 139, 1.0); // 초기 색상 설정
    return Scaffold(
      appBar: BaseAppBar(AppBar(), '롤링페이퍼 만들기', true, false, false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                  width: 192,
                  height: 30,
                  margin: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5), // 배경색
                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                  ),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white, // TextField 내부 배경색
                      hintText: '진선님의 롤링페이퍼 방',
                    ),
                  )),
              Image.asset('assets/edit.png')
            ]),
            Container(
                margin: EdgeInsets.only(top: 10),
                height: 1,
                color: Color(0xFFF5F5F5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 90), // 원하는 너비로 설정
                  child: RadioListTile<int>(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('공개',
                        style: TextStyle(
                            color: _selectedopen == 0
                                ? Color(0xFFFD928B)
                                : Colors.black)),
                    value: 0,
                    groupValue: _selectedopen,
                    visualDensity:
                        VisualDensity(horizontal: -4.0, vertical: -4.0),
                    onChanged: (int? value) {
                      setState(() {
                        _selectedopen = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10, height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 110), // 원하는 너비로 설정
                  child: RadioListTile<int>(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('비공개',
                        style: TextStyle(
                            color: _selectedopen == 1
                                ? Color(0xFFFD928B)
                                : Colors.black)),
                    value: 1,
                    groupValue: _selectedopen,
                    visualDensity:
                        VisualDensity(horizontal: -4.0, vertical: -4.0),
                    onChanged: (int? value) {
                      setState(() {
                        _selectedopen = value!;
                      });
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 110), // 원하는 너비로 설정
                  child: RadioListTile<int>(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('친구만',
                        style: TextStyle(
                            color: _selectedopen == 2
                                ? Color(0xFFFD928B)
                                : Colors.black)),
                    value: 2,
                    groupValue: _selectedopen,
                    visualDensity:
                        VisualDensity(horizontal: -4.0, vertical: -4.0),
                    onChanged: (int? value) {
                      setState(() {
                        _selectedopen = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            ),
            Container(
              width: 130,
              child: CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                title: Text(
                  '공개 날짜',
                  style: TextStyle(
                    color: release_date ? Color(0xFFFD928B) : Colors.black,
                  ),
                ),
                value: release_date,
                onChanged: (bool? value) {
                  setState(() {
                    release_date = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            if (release_date)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // 그림자 색상 및 투명도
                      spreadRadius: 2, // 그림자 확산 반경
                      blurRadius: 5, // 그림자 흐림 정도
                      offset: Offset(0, 3), // 그림자 오프셋
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 10, left: 10, bottom: 24),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (date) {
                      // 선택된 날짜를 처리하는 로직 추가
                    },
                  ),
                ),
              ),
            Container(height: 1, color: Color(0xFFF5F5F5)),
            Container(
              margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
              child: Text('소개글',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                maxLines: null,
                maxLength: 500,
                style: TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5), // TextField 내부 배경색
                  hintText: '롤링페이퍼에 대한 소개를 적어주세요.',
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('템플릿 설정하기',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 8, width: 8),
                    Text('현재 선택된 템플릿',
                        style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF8A8A8A),
                            fontWeight: FontWeight.w700)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (containerColor != initialColor)
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 8, bottom: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: containerColor,
                            ),
                          ),
                          SizedBox(height: 8, width: 8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          width: 70,
                          height: 70,
                          margin: EdgeInsets.only(top: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets
                                  .zero, // 버튼의 패딩을 제거하여 이미지가 버튼 크기에 맞게 함
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () => buildSheet(context),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(5), // 이미지의 모서리도 둥글게
                              child: Image.asset(
                                'assets/rainbow.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 62, width: 62),
                    Row(
                      children: [
                        Text('초대코드 : ${code}',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8A8A8A),
                                fontWeight: FontWeight.w800)),
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            width: 51,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // 그림자 색상 및 투명도
                                    spreadRadius: 2, // 그림자 확산 반경
                                    blurRadius: 5, // 그림자 흐림 정도
                                    offset: Offset(0, 3), // 그림자 오프셋
                                  )
                                ]),
                            child: TextButton(
                                onPressed: () => {},
                                child: Text('복사',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800))))
                      ],
                    ),
                    SizedBox(height: 30, width: 30),
                    Text('이 방의 참가요청을 받으시겠습니까?',
                        style: TextStyle(
                            color: Color(0xFFFF0000),
                            fontWeight: FontWeight.w800,
                            fontSize: 14))
                  ],
                )),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 90), // 원하는 너비로 설정
                child: RadioListTile<int>(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('예',
                      style: TextStyle(
                          color: _selectedrequest == 0
                              ? Color(0xFFFD928B)
                              : Colors.black)),
                  value: 0,
                  groupValue: _selectedrequest,
                  visualDensity:
                      VisualDensity(horizontal: -4.0, vertical: -4.0),
                  onChanged: (int? value) {
                    setState(() {
                      _selectedrequest = value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 10, height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 110), // 원하는 너비로 설정
                child: RadioListTile<int>(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('아니요',
                      style: TextStyle(
                          color: _selectedrequest == 1
                              ? Color(0xFFFD928B)
                              : Colors.black)),
                  value: 1,
                  groupValue: _selectedrequest,
                  visualDensity:
                      VisualDensity(horizontal: -4.0, vertical: -4.0),
                  onChanged: (int? value) {
                    setState(() {
                      _selectedrequest = value!;
                    });
                  },
                ),
              )
            ])
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // 그림자의 위치 조정
            ),
          ],
          color: Colors.white, // 배경 색상 설정
        ),
        child: Center(
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFFD928B)),
                fixedSize: MaterialStateProperty.all(Size(230, 55)), // 버튼 크기 설정
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
            child: Text('선택하기',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onPressed: () {
              Get.toNamed("/room");
            },
          ),
        ),
      ),
    );
  }
}

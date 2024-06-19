import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String item1 = '신고하기';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: PopupMenuButton<String>(
          onSelected: (String result) {
            setState(() {
              // 선택된 항목에 따른 동작을 정의할 수 있습니다.
              if (result == item1) {
                // 예: 신고하기 동작 수행
                print('신고하기 선택됨');
              }
            });
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: item1,
              child: Text(item1),
            ),
          ],
        ),
      ),
    );
  }
}

class Complaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint'),
      ),
      body: Center(child: Text('Complaint Screen')),
    );
  }
}
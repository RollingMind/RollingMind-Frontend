import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/sheet_widget.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<String> posttitle = [
    "제목1",
    "제목2",
    "제목3",
    "제목4",
    "제목5",
    "제목6",
    "제목7",
    "제목8",
    "제목8",
    "제목9",
    "제목10"
  ];
  List<String> author = [
    "사람",
    "사람2",
    "사람3",
    "사람4",
    "사람5",
    "살마6",
    "사람7",
    "사람8",
    "사람8",
    "살마9",
    "살마10"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(AppBar(), '롤링페이퍼', true, false, false),
        backgroundColor: containerColor,
        //bottomNavigationBar: IconButton(child Icons.add, onPressed: (){},),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 36, width: 5),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16.0, // 각 위젯 사이의 가로 간격
                  runSpacing: 24.0, // 각 줄 사이의 세로 간격
                  children: List.generate(posttitle.length, (index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: 171,
                        height: 185,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 12, top: 16),
                              child: Text(
                                posttitle[index],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(right: 10, bottom: 8),
                                  child: Text('from ${author[index]}',
                                      style: TextStyle()),
                                )
                              ],
                            ),
                          ],
                        ));
                  }),
                ),
              )
            ],
          ),
        ),
        );
        
  }
}

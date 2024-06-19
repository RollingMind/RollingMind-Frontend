import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rollingmind_front/pages/auth/create_room_page.dart';

Color pickerColor = Color.fromRGBO(253, 146, 139, 100); // 미리보기 색깔(없으면 불투명됨.)
Color containerColor = Color.fromRGBO(253, 146, 139, 100);
Color initialColor = Color.fromRGBO(253, 146, 139, 100);

void buildSheet(BuildContext context) {
  List<likeItem> kItems = [
    likeItem(image: 'assets/test1.jpg'),
    likeItem(image: 'assets/test2.jpg'),
    likeItem(image: 'assets/test3.jpg'),
    likeItem(image: 'assets/test4.jpg'),
    likeItem(image: 'assets/test5.jpg')
  ];
  List<recomItem> rItems = [
    recomItem(image: 'assets/test1.jpg'),
    recomItem(image: 'assets/test2.jpg'),
    recomItem(image: 'assets/test3.jpg'),
    recomItem(image: 'assets/test4.jpg'),
    recomItem(image: 'assets/test5.jpg')
  ];
  Future<Color?> showPicker(BuildContext context) async {
    return await showDialog<Color?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            '색상 선택하기',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (Color color) {
                pickerColor = color;
              },
              pickerAreaHeightPercent: 0.8,
              enableAlpha: false,
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 52,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFD928B)),
                    ),
                    child: Text('확인', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop(pickerColor);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return FractionallySizedBox(
              heightFactor: 0.8,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, top: 24),
                      child: Text('템플릿 설정하기',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10, bottom: 24),
                        height: 1,
                        color: Color(0xFFF0F0F0)),
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('기본 색상 템플릿',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF8A8A8A),
                                      fontWeight: FontWeight.w700)),
                              Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 24, right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: containerColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Color? selectedColor =
                                          await showPicker(context);
                                      if (selectedColor != null) {
                                        setState(() {
                                          containerColor = selectedColor;
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      color: containerColor,
                                    ),
                                  ),
                                ),
                              ),
                              Text('좋아요 누른 템플릿',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF8A8A8A),
                                      fontWeight: FontWeight.w700)),
                              Container(
                                  margin: EdgeInsets.only(top: 12, bottom: 32),
                                  height: 100,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      separatorBuilder: (context, _) =>
                                          SizedBox(width: 16), //db값 가져와서 사용하기.
                                      itemBuilder: (context, index) =>
                                          Mylike(kItems[index]))),
                              Text('추천 템플릿',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF8A8A8A),
                                      fontWeight: FontWeight.w700)),
                              Container(
                                  margin: EdgeInsets.only(top: 12, bottom: 32),
                                  height: 100,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      separatorBuilder: (context, _) =>
                                          SizedBox(width: 16), //db값 가져와서 사용하기.
                                      itemBuilder: (context, index) =>
                                          Recommend(rItems[index])))
                            ])),
                    Spacer(),
                    Container(
                        height: 80,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // 그림자의 위치 조정
                          )
                        ], color: Colors.white // 배경 색상 설정
                            ),
                        child: Center(
                            child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFFD928B)),
                              fixedSize: MaterialStateProperty.all(
                                  Size(230, 55)), // 버튼 크기 설정
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          child: Text('선택하기',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          onPressed: () {
                            Navigator.pop(context, Color.fromRGBO(253, 146, 139, 100));
                          },
                        ))),
                  ],
                ),
              ));
        },
      );
    },
  ).then((_) {
    });
}

Widget Mylike(likeItem kItems) => Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10), // 모든 모서리를 둥글게 설정
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // 이미지도 모든 모서리를 둥글게
        child: Image.asset(kItems.image, fit: BoxFit.cover),
      ),
    );
Widget Recommend(recomItem rItems) => Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10), // 모든 모서리를 둥글게 설정
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // 이미지도 모든 모서리를 둥글게
        child: Image.asset(rItems.image, fit: BoxFit.cover),
      ),
    );

class likeItem {
  final String image;
  const likeItem({required this.image});
}

class recomItem {
  final String image;
  const recomItem({required this.image});
}

///전역변수 관리
class ColorProvider extends InheritedWidget {
  final ColorNotifier colorNotifier;

  ColorProvider({Key? key, required Widget child})
      : colorNotifier = ColorNotifier(),
        super(key: key, child: child);

  static ColorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorProvider>();
  }

  @override
  bool updateShouldNotify(ColorProvider oldWidget) {
    return colorNotifier != oldWidget.colorNotifier;
  }
}

class ColorNotifier extends ChangeNotifier {
  Color _color = Color.fromRGBO(253, 146, 139, 1.0); // 초기 색상 설정

  Color get color => _color;

  void setColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }
}

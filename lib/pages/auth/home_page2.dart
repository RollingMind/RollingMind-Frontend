import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rollingmind_front/pages/auth/home_page.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _slider = 0;
  String nickname = '여름이 지나간 계절';
  String title = '지연이 생일 축하 해주세요 국민 여러분.';
  final CarouselController _controller = CarouselController();
  final List<String> imageList = [    "assets/banner1.png",    "assets/banner2.png",    "assets/banner3.png"  ];
  List<HotRightNowItem> hItems = [
    HotRightNowItem(image: 'assets/test1.jpg', title: '지연이 생일 축하 해주세요 국민 여러분.', nickname: '여름이 지나간 계절', participantsCount: 703),
    HotRightNowItem(image: 'assets/test2.jpg', title: '지연이 생일 축하 해주세요 국민 여러분.', nickname: '여름이 지나간 계절', participantsCount: 123),
    HotRightNowItem(image: 'assets/test3.jpg', title: '지연이 생일 축하 해주세요 국민 여러분.', nickname: '여름이 지나간 계절', participantsCount: 2345),
    HotRightNowItem(image: 'assets/test4.jpg', title: '지연이 생일 축하 해주세요 국민 여러분.', nickname: '여름이 지나간 계절', participantsCount: 333),
    HotRightNowItem(image: 'assets/test5.jpg', title: '지연이 생일 축하 해주세요 국민 여러분.', nickname: '여름이 지나간 계절', participantsCount: 534)
  ];
  List<MostPopularItem> mItems = [
    MostPopularItem(image:'assets/test1.jpg'),
    MostPopularItem(image: 'assets/test2.jpg'),
    MostPopularItem(image: 'assets/test3.jpg'),
    MostPopularItem(image: 'assets/test4.jpg'),
    MostPopularItem(image: 'assets/test5.jpg')
  ];
  List<BrithItem> bItems = [
    BrithItem(image: 'assets/test1.jpg'),
    BrithItem(image: 'assets/test2.jpg'),
    BrithItem(image: 'assets/test3.jpg'),
    BrithItem(image: 'assets/test4.jpg'),
    BrithItem(image: 'assets/test5.jpg')
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(AppBar(), '롤링 마인드', false, true, true),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              margin: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 200, // 컨테이너의 높이를 명시적으로 지정
                width: double.infinity, // 컨테이너의 너비를 화면 전체로 설정
                child: Center(
                  child: Stack(
                    children: [
                      sliderWidget(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 16.0, bottom: 4.0),
              child: Text('인기절정 템플릿 ⭐',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(253, 146, 139, 100))),
            ),
            Container(
              height: 181,
              margin: EdgeInsets.only(top: 8.0, left: 16.0, bottom: 4.0),
              child:ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, _) => SizedBox(width: 16),//db값 가져와서 사용하기.
                itemBuilder: (context, index)=>mostPopular(mItems[index])
                )
            ),
            Container(
              height: 136,
              color: Color.fromRGBO(255, 239, 239, 100),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("지금 핫한 롤링페이퍼 🔥", style:TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Color.fromRGBO(253, 146, 139, 100))),
                      TextButton(onPressed: (){Get.toNamed("/hotrightnow");}, child: Text('더보기 >', style: TextStyle( fontSize: 12.0, color: Color.fromRGBO(143, 1433, 143, 100))))]
                    )
                  ),
                  SizedBox(
                    height: 70,
                    child:ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, _) => SizedBox(width: 16),//db값 가져와서 사용하기.
                      itemBuilder: (context, index)=>hotRightNow(hItems[index])
                      )
                  ),
                ])
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0, left: 16.0, bottom: 4.0),
              alignment: Alignment.topLeft,
              child: Text("생일 축하 템플릿 🎂", style:TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color.fromRGBO(253, 146, 139, 100))),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              height: 181,
              child:ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, _) => SizedBox(width: 16),//db값 가져와서 사용하기.
                itemBuilder: (context, index)=>Brith(bItems[index])
              )
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Color(0xFFFD928B),
        foregroundColor: Colors.white,
        buttonSize: Size(80, 80),
        childrenButtonSize: Size(60, 70),
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        spacing: 11,
        children: [
          SpeedDialChild(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)),
            child: Image.asset('assets/enter.png'),
            onTap: (){
              Get.toNamed("/participate_room");
            }
          ),
          SpeedDialChild(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onTap: (){
              Get.toNamed("/create_room");
            },
            child: Image.asset('assets/plus2.png')
          ),
        ],
      ),
    );
  }

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map((img) {
        return Builder(
          builder: (context) {
            return Image.asset(
              img,
              fit: BoxFit.cover,
              width: double.infinity, // 이미지의 너비를 화면 전체로 설정
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200, // 슬라이더의 높이를 명시적으로 지정
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            _slider = index;
          });
        },
      ),
    );
  }
}
Widget hotRightNow(HotRightNowItem item) {
  String trimmedNickname = item.nickname.length > 8 ? '${item.nickname.substring(0, 7)}...' : item.nickname;

  return Container(
    width: 340,
    height: 70,
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16),
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/bubble.png', fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
            Row(
              children: [
                Text(trimmedNickname, style: TextStyle(color: Color(0xFFFD928B), fontWeight: FontWeight.w600, fontSize: 11)),
                Text('게시 | ', style: TextStyle(color: Color(0xFF8F8F8F), fontSize: 11)),
                Text('${item.participantsCount} 참여중', style: TextStyle(color: Color(0xFF8F8F8F), fontSize: 10, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
  Widget mostPopular(MostPopularItem item) => Container( //인기절정
    width: 128,
    height: 181,
    color: Colors.orange,
    child: Image.asset(item.image, fit: BoxFit.cover)
  );
  Widget Brith(BrithItem item)=> Container( //생일축하
    width: 128,
    height: 181,
    color: Colors.orange,
    child: Image.asset(item.image, fit: BoxFit.cover)
  );

class HotRightNowItem {
  final String image;
  final String title;
  final String nickname;
  final int participantsCount;
  const HotRightNowItem({
    required this.image,
    required this.title,
    required this.nickname,
    required this.participantsCount
  });
}
class BrithItem {
  final String image;
  const BrithItem({
    required this.image
  });
}
class MostPopularItem{
  final String image;
  const MostPopularItem({
    required this.image
  });
}
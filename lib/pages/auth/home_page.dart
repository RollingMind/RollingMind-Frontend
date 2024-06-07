import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rollingmind_front/apis/auth_api.dart';
import 'package:rollingmind_front/pages/auth/template_page.dart';
import 'package:rollingmind_front/utils/colors.dart';
import 'package:rollingmind_front/utils/response.dart';
import 'package:rollingmind_front/widgets/base_app_bar_widget.dart';
import 'package:rollingmind_front/widgets/login_text_field_widget.dart';
import 'package:rollingmind_front/widgets/login_sns_button_widget.dart';

import 'package:rollingmind_front/pages/auth/add_friends_page.dart';
import 'package:rollingmind_front/pages/auth/template_page.dart';
import 'package:rollingmind_front/pages/auth/fire_paper_page.dart';
import 'package:rollingmind_front/pages/auth/my_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MarketPage(),
    );
  }
}

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);
 
  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
 
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
  );
  
  final List<Widget> _widgetOptions = <Widget>[
    FirePaperPage(),
    AddFriendsPage(),
    HomePage(),
    TemplatePage(),
    MyPage(), // 마이페이지 클래스 이름 수정
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/fire.png')),
            label: '지핫롤',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/fire.png')),
            label: '친구추가',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/fire.png')),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/fire.png')),
            label: '템플릿',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/fire.png')),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFD928B),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    // 해당 클래스가 호출되었을 때
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:rollingmind_front/pages/auth/add_friends_page.dart';
import 'package:rollingmind_front/pages/auth/fire_paper_page.dart';
import 'package:rollingmind_front/pages/auth/home_page2.dart';
import 'package:rollingmind_front/pages/auth/template_page.dart';
import 'package:rollingmind_front/pages/auth/my_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  int _selectedIndex = 2;
  
  List<Widget> body = const [
    FirePaperPage(), // '지핫롤'
    AddFriendsPage(), // '친구추가'
    HomePage2(), // '홈'
    TemplatePage(), // '템플릿'
    MyPage() // '마이페이지'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 선택된 버튼이 커지는 효과 제거
        currentIndex: _selectedIndex,
        onTap: (int newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/fire.png')),
            label: '지핫롤',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/addpeople.png')),
            label: '친구추가',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/home.png')),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/template.png')),
            label: '템플릿',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('menu/people.png')),
            label: '마이페이지',
          ),
        ],
        selectedItemColor: Color(0xFFFD928B),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

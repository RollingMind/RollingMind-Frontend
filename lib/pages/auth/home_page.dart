import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rollingmind_front/pages/auth/add_friends_page.dart';
import 'package:rollingmind_front/pages/auth/frie_paper_page.dart';
import 'package:rollingmind_front/pages/auth/home_page2.dart';
import 'package:rollingmind_front/pages/auth/my_page.dart';
import 'package:rollingmind_front/pages/auth/template_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MarketPage();
  }
}

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  int _selectedIndex = 2; // 홈 페이지를 기본으로 설정

  static const List<Widget> _pages = [
    FirePaperPage(), // '지핫롤'
    AddFriendsPage(), // '친구추가'
    HomePage2(), // '홈'
    TemplatePage(), // '템플릿'
    MyPage() // '마이페이지'
  ];

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 2) { // 홈 페이지가 아닌 경우
      setState(() {
        _selectedIndex = 2; // 홈 페이지로 이동
      });
      return false; // 앱을 종료하지 않음
    }
    SystemNavigator.pop();
    return false; // 홈 페이지인 경우 기본 동작 (앱 종료)
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _pages[_selectedIndex], // 선택된 페이지를 표시
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 선택된 버튼이 커지는 효과 제거
          currentIndex: _selectedIndex,
          onTap: (int newIndex) {
            setState(() {
              _selectedIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/frie.png', width: 24, height: 24),
              activeIcon: Image.asset('assets/frie_active.png', width: 24, height: 24),
              label: '지핫롤',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: '친구추가',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/template.png', width: 24, height: 24),
              activeIcon: Image.asset('assets/template_active.png', width: 24, height: 24),
              label: '템플릿',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '마이페이지',
            ),
          ],
          selectedItemColor: Color(0xFFFD928B),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

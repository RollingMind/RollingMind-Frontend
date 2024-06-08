import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rollingmind_front/pages/auth/add_friends_page.dart';
import 'package:rollingmind_front/pages/auth/fire_paper_page.dart';
import 'package:rollingmind_front/pages/auth/template_page.dart';
import 'package:rollingmind_front/pages/auth/my_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    FirePaperPage(), // '지핫롤'
    AddFriendsPage(), // '친구추가'
    Container(), // '홈'
    TemplatePage(), // '템플릿'
    MyPage(), // '마이페이지'
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFD928B),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
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

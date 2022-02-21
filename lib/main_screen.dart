import 'package:flutter/material.dart';
import 'package:quotes_app/home.dart';
import 'package:quotes_app/characters_page.dart';
import 'package:quotes_app/favorites.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  int _pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomePage(),
    RandomWords(),
    // SearchPage(),
    // QuotesPage(),
    Favorites()
  ];

  void _onNavigationTap(int index){
      setState(() {
      _pageIndex = index;
    });
    // pageController.jumpToPage(index);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        selectedItemColor: Colors.purple[600],
        onTap: _onNavigationTap,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Characters'),
          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.format_quote_rounded), label: 'Quotes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}

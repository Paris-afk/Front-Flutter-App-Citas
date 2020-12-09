import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//---------Widgets of the root pages
//import 'matches/matches.dart';
import 'matches/rootmatches.dart';
import 'randChat/randChat.dart';
import 'searchSeaction/search.dart';
import 'user/user_profile.dart';
import 'swipe/swipe.dart';

class RootLayout extends StatefulWidget {
  @override
  _RootLayout createState() => _RootLayout();
}

class _RootLayout extends State<RootLayout> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    RootMatches(),
    RandChat(),
    Search(),
    UserProfile(),
    Swipes(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_emoticon,
            ),
            label: 'Match',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'RandChat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: 'Swipes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

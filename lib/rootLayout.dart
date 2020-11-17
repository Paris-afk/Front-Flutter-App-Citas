import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//---------Widgets of the root pages
import 'matches/matches.dart';
import 'randChat/randChat.dart';
import 'searchSeaction/search.dart';
import 'user/user_profile.dart';
import 'swipe/swipe.dart';

class RootLayout extends StatefulWidget{
  @override
  _RootLayout createState() => _RootLayout();
}

class _RootLayout extends State<RootLayout>{
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Matches(),
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
        backgroundColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon, color: Colors.white,),
            title: Text('Match', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.white,),
            title: Text('RandChat', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white,),
            title: Text('Search', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white,),
            title: Text('Search', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            title: Text('Swipes', style: TextStyle(color: Colors.white),),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatefulWidget{
  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar>{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }

}


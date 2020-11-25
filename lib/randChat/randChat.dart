import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RandChat extends StatefulWidget{
  @override
  _RandChat createState() => _RandChat();
}

class _RandChat extends State<RandChat>{
  final _chats = <Widget>[];

  /*for(var i = 0; i < 10; i++){
  _chats.add(ListTile());
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text("Here you will be able to find chats with random people who is near of you"),
        ListView(
          children: _chats,
        ),
      ],
    );
  }
}
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RandChat extends StatefulWidget{
  @override
  _RandChat createState() => _RandChat();
}

class _RandChat extends State<RandChat>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Here you will be able to find chats with random people who is near of you"),
      ],
    );
  }
}
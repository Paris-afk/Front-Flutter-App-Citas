import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Matches extends StatefulWidget{
  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Here you will be able to see all of your matches so you can chat with them"),
      ],
    );
  }
}
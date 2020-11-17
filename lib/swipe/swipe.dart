import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/BottomNavBar.dart';

class Swipes extends StatefulWidget{
  @override
  _Swipes createState() => _Swipes();

}

class _Swipes  extends State<Swipes>{
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Text(
              "Swipes section"
            ),
          ],
        );
  }

}
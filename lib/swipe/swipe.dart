import 'package:flutter/material.dart';

class Swipes extends StatefulWidget{
  @override
  _Swipes createState() => _Swipes();

}

class _Swipes  extends State<Swipes>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Swipes section"
            ),
          ],
        ),
      ),
    );
  }

}
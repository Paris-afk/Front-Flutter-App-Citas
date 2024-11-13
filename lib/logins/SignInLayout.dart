import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './SignIn/SignInStructure.dart';

class SignInLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.orange.shade900, Colors.orange.shade400])),
        child: SignInStructure(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'logins/loginForm/loginForm.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.yellow,
      ),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}

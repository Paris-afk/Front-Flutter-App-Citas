import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../SignInLayout.dart';
import 'package:citas_proyecto/appRootPages/rootLayout.dart';
import './loginReq.dart';
import '../../main.dart';
import 'package:get/get.dart';
import 'dart:async';

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  Future<User> _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.orange[900], Colors.orange[400]])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: (_futureUser == null)
                    ? Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color.fromRGBO(225, 95, 27, .3),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText:
                                                "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                          ),
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            if (!value.contains('@') ||
                                                !value.contains('.com')) {
                                              print('Invalid password');
                                              return 'It\'s not an email address';
                                            }
                                            if (value.contains(' ')) {
                                              return 'No spaces allowed';
                                            }
                                            return null;
                                          },
                                          onChanged: (String writtenEmail) {
                                            setState(() {
                                              _email = writtenEmail;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none,
                                          ),
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            if (value.contains(' ')) {
                                              return 'No spaces allowed';
                                            }
                                            return null;
                                          },
                                          onChanged: (String writtenPassword) {
                                            setState(() {
                                              _password = writtenPassword;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                /*Text(
                                  "Olvidaste tu contraseña?",
                                  style: TextStyle(color: Colors.grey),
                                ),*/
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    height: 50,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 60),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.orange[900]),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          FlatButton(
                                            child: Text(
                                              "Log in",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () {
                                              print('Session started');
                                              if (_formKey.currentState
                                                  .validate()) {
                                                // If the form is valid, display a snackbar. In the real world,
                                                // you'd often call a server or save the information in a database.

                                                setState(() {
                                                  _futureUser = getUserLogin(
                                                    _email,
                                                    _password,
                                                  );
                                                  _futureUser.then(
                                                    (value) {
                                                      print(
                                                          'ESTE ES EL VALOR OBTENIDO: ' +
                                                              value.data
                                                                  .toString());
                                                      if (value.data != null) {
                                                        Get.off(RootLayout());
                                                      }
                                                    },
                                                  );
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 60),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange[900]),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        FlatButton(
                                          child: Text(
                                            "Sign up",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            print('Sign in');
                                            Get.to(SignInLayout());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : FutureBuilder<User>(
                        future: _futureUser,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print('Bien hecho: ' + snapshot.data.jwt);
                          } else if (snapshot.hasError) {
                            print('Mal hecho: ' + snapshot.error.toString());
                            return Center(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: [
                                    Text("${snapshot.error}"),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text("Could not log in. Please try again"),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.pressed))
                                              return Colors.redAccent;
                                            return Colors
                                                .deepOrangeAccent; // Use the component's default.
                                          },
                                        ),
                                      ),
                                      child: Text('Try again'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          }

                          return Center(child: CircularProgressIndicator());
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

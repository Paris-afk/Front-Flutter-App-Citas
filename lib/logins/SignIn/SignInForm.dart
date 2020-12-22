import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../appRootPages/rootLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInForm createState() => _SignInForm();
}

class User {
  final String email;
  final String password;
  //final String description;
  final String name;
  final String lastname;
  final String birthDate;
  //int _birthDate;
  final String sex;
  final String preferences;

  User(
      {this.email,
      this.password,
      this.name,
      this.lastname,
      this.birthDate,
      this.sex,
      this.preferences});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      lastname: json['lastname'],
      birthDate: json['age'],
      sex: json['sex'],
      preferences: json['preferences'],
    );
  }
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _description;
  String _name;
  String _last_name;
  String _birthDate;
  //int _birthDate;
  String _genre;
  String _sexual_preference;
  Future<User> _futureUser;

  Future<User> createUser(String name, String lastname, String email,
      String password, String preferences, String genre, String age) async {
    final http.Response response = await http.post(
      'http://localhost:3000/api/user/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'lastname': lastname,
        'email': email,
        'password': password,
        'sexual_preference': 0,
        'genre': 0,
        'birthDate': age,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              if (!value.contains('@') && !value.contains('.com')) {
                print('Invalid password');
                return 'It\'s not an email address';
              }
              if (value.contains(' ')) {
                return 'No spaces allowed';
              }
              return null;
            },
            onChanged: (String newEmail) {
              setState(() {
                _email = newEmail.trim();
              });
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
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
            onChanged: (String newPwd) {
              setState(() {
                _password = newPwd.trim();
              });
            },
          ),
          /*TextFormField(
                              decoration: InputDecoration(
                                hintText: "Description",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onChanged: (String newDescription) {
                                setState(() {
                                  _description = newDescription.trim();
                                });
                              },
                            ),*/
          TextFormField(
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (String newName) {
              setState(() {
                _name = newName.trim();
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Lastname",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (String newLastName) {
              setState(() {
                _last_name = newLastName.trim();
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 2,
            decoration: InputDecoration(
              hintText: "Age",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              if (value.contains('.') ||
                  value.contains(' ') ||
                  value.contains('-') ||
                  value.contains(',')) {
                return 'No simbols allowed';
              }
              if (int.parse(value) < 18) {
                return 'You must be at least 18';
              }
              return null;
            },
            onChanged: (String newAge) {
              setState(() {
                _birthDate = newAge;
              });
            },
          ),
          DropdownButtonFormField<String>(
            hint: Text("Sex"),
            value: _genre,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepOrangeAccent),
            validator: (value) {
              if (value == null) {
                return "Pick an option";
              }
              return null;
            },
            onChanged: (String newSex) {
              setState(() {
                _genre = newSex;
              });
            },
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButtonFormField<String>(
            hint: Text("Preferences"),
            value: _sexual_preference,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepOrangeAccent),
            validator: (value) {
              if (value == null) {
                return "Pick an option";
              }
              return null;
            },
            onChanged: (String newPreferences) {
              setState(() {
                _sexual_preference = newPreferences;
              });
            },
            items: <String>['Male', 'Female', 'Both']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.redAccent;
                  return Colors
                      .deepOrangeAccent; // Use the component's default.
                },
              ),
            ),
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                setState(() {
                  _futureUser = createUser(_name, _last_name, _email, _password,
                      _sexual_preference, _genre, _birthDate);
                });
                FutureBuilder<User>(
                  future: _futureUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.name);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                );

                /*Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));*/

                print(_email +
                    '\n' +
                    _password +
                    '\n' +
                    _name +
                    '\n' +
                    _last_name +
                    '\n' +
                    _birthDate.toString() +
                    '\n' +
                    _genre +
                    '\n' +
                    _sexual_preference);
                /*Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RootLayout()));*/
              }
            },
            child: Text('Create account'),
          ),
        ],
      ),
    );
  }
}

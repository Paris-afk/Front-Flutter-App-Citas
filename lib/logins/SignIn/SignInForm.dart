import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _description;
  String _name;
  String _last_name;
  String _age;
  //int _age;
  String _sex;
  String _preferences;

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
                _age = newAge;
              });
            },
          ),
          DropdownButtonFormField<String>(
            hint: Text("Sex"),
            value: _sex,
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
                _sex = newSex;
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
            value: _preferences,
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
                _preferences = newPreferences;
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

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));

                print(_email +
                    '\n' +
                    _password +
                    '\n' +
                    _name +
                    '\n' +
                    _last_name +
                    '\n' +
                    _age.toString() +
                    '\n' +
                    _sex +
                    '\n' +
                    _preferences);
              }
              /*Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RootLayout()));*/
            },
            child: Text('Create account'),
          ),
        ],
      ),
    );
  }
}

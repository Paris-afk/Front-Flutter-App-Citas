import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../appRootPages/rootLayout.dart';
import './user_image_picking/user_img_picker.dart';
import '../SignInLayout.dart';
import '../../main.dart';
import './postUser.dart';
import 'package:get/get.dart';
import 'package:citas_proyecto/priv_policy.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _last_name;
  String _email;
  String _password;
  String _sexual_preference;
  int _selected_preference;
  String _sex;
  int _selected_sex;
  int _age;
  String _description;
  Future<User> _futureUser;
  //var changeToImgPicker = null;

  @override
  Widget build(BuildContext context) {
    return (_futureUser == null)
        ? Form(
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
                    if (!value.contains('@') || !value.contains('.com')) {
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
                TextFormField(
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
                ),
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
                      _age = int.parse(newAge);
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
                      if (newSex == 'Male') {
                        _selected_sex = 1;
                      } else {
                        _selected_sex = 2;
                      }
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
                      if (newPreferences == 'Male') {
                        _selected_preference = 1;
                      } else if (newPreferences == 'Female') {
                        _selected_preference = 2;
                      } else {
                        _selected_preference = 3;
                      }
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
                  child: Text('Create account'),
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Privacy policy'),
                          content: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height / 2,
                            ),
                            child: SingleChildScrollView(
                              child: Text(
                                privPolicy,
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'Don\'t accept',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text('I accept'),
                              onPressed: () {
                                setState(() {
                                  _futureUser = createUser(
                                      _name,
                                      _last_name,
                                      _email,
                                      _password,
                                      _selected_preference,
                                      _selected_sex,
                                      _age.toInt(),
                                      _description);
                                });
                                
                                Navigator.pop(context);

                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          )
        : FutureBuilder<User>(
            future: _futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('Bien hecho: ' +
                    snapshot.data.data.toString() +
                    snapshot.data.jwt);

                return UserImgPicker();
              } else if (snapshot.hasError) {
                print('Mal hecho: ' + snapshot.error.toString());
                return Center(
                  child: Column(
                    children: [
                      Text("${snapshot.error}"),
                      SizedBox(
                        height: 50,
                      ),
                      Text("Could not create user. Please try again"),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
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
                                  builder: (context) => SignInLayout()));
                        },
                      )
                    ],
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          );
  }
}

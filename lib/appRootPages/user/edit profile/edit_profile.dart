import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:get/get.dart';
import '../request/fetchUser.dart';
import './update_profile_req.dart';
import 'dart:io';
import 'dart:async';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import '../edit_profile_img/edit_img_form.dart';

class UserEdit extends StatefulWidget {
  @override
  _UserEdit createState() => _UserEdit();
}

class _UserEdit extends State<UserEdit> {
  //final userDataController = Get.put(UserJWT());
  final _formKey = GlobalKey<FormState>();
  final userJWTcontroller = Get.put(UserJWT());
  late Future<Map<String, dynamic>> futureUser;
  late Future<Map<String, dynamic>> _futureUserUpdate;
  late String profileImgName;

  late String _name, _last_name, _email, _description, _sex, _sexual_preference;
  late int _idUser, _age, _selected_sex, _selected_preference;

  onGoBack(dynamic value) {
    setState(() {
      futureUser = fetchUser();
    });
  }

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
    futureUser.then((value) {
      _idUser = value['id_user'];
      _name = value['name'];
      _last_name = value['lastname'];
      _email = value['email'];
      _age = value['age'];
      _description = value['description'];
      _sex = (value['id_genre'] == 1) ? 'Male' : 'Female';
      _selected_sex = (value['id_genre'] == 1) ? 1 : 2;
      if (value['id_sexual_preference'] == 1) {
        _sexual_preference = 'Male';
        _selected_preference = 1;
      } else if (value['id_sexual_preference'] == 2) {
        _sexual_preference = 'Female';
        _selected_preference = 2;
      } else {
        _sexual_preference = 'Both';
        _selected_preference = 3;
      }

      profileImgName = value['profile_picture'].split('\\').last.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(EditProfileImg(
            key: UniqueKey(),
            imgName: this.profileImgName,
          ))?.then((value) => onGoBack(value));
        },
        label: Text('Change image'),
        icon: Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: (_futureUserUpdate == null)
          ? FutureBuilder<Map<String, dynamic>>(
              future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.network(
                                  userJWTcontroller.backendRootLink +
                                          'image/profile/' +
                                          snapshot.data?['profile_picture'] ??
                                      ''.split('\\').last.toString(),
                                  headers: {
                                    HttpHeaders.authorizationHeader:
                                        "Bearer " + userJWTcontroller.jwt.value
                                  },
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : CircularProgressIndicator();
                                  },
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                _name +
                                    " " +
                                    _last_name +
                                    " - " +
                                    _age.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                "Edit your data",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: TextFormField(
                                        initialValue: _name,
                                        decoration: InputDecoration(
                                          hintText: "Name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                          labelText: 'Name',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: TextFormField(
                                        initialValue: _last_name,
                                        decoration: InputDecoration(
                                          hintText: "Last name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                          labelText: 'Last name',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: TextFormField(
                                        initialValue: _email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                          labelText: 'Email',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
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
                                        onChanged: (String newEmail) {
                                          setState(() {
                                            _email = newEmail.trim();
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: TextFormField(
                                        initialValue: _age.toString(),
                                        keyboardType: TextInputType.number,
                                        maxLength: 2,
                                        decoration: InputDecoration(
                                          hintText: "Age",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                          labelText: 'Age',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: TextFormField(
                                        initialValue: _description,
                                        decoration: InputDecoration(
                                          hintText: "Description",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                          labelText: 'Description',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        onChanged: (String newDescription) {
                                          setState(() {
                                            _description =
                                                newDescription.trim();
                                          });
                                        },
                                      ),
                                    ),
                                    DropdownButtonFormField<String>(
                                      hint: Text("Sex"),
                                      value: _sex,
                                      decoration: InputDecoration(
                                        hintText: "Sex",
                                        labelText: 'Sex',
                                      ),
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent),
                                      validator: (value) {
                                        if (value == null) {
                                          return "Pick an option";
                                        }
                                        return null;
                                      },
                                      onChanged: (String? newSex) {
                                        setState(() {
                                          if (newSex == 'Male') {
                                            _selected_sex = 1;
                                          } else {
                                            _selected_sex = 2;
                                          }
                                          _sex = newSex!;
                                        });
                                      },
                                      items: <String>['Male', 'Female']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    DropdownButtonFormField<String>(
                                      hint: Text("Preferences"),
                                      decoration: InputDecoration(
                                        hintText: "Preferences",
                                        labelText: 'Preferences',
                                      ),
                                      value: _sexual_preference,
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent),
                                      validator: (value) {
                                        if (value == null) {
                                          return "Pick an option";
                                        }
                                        return null;
                                      },
                                      onChanged: (String? newPreferences) {
                                        setState(() {
                                          if (newPreferences == 'Male') {
                                            _selected_preference = 1;
                                          } else if (newPreferences ==
                                              'Female') {
                                            _selected_preference = 2;
                                          } else {
                                            _selected_preference = 3;
                                          }
                                          _sexual_preference = newPreferences!;
                                        });
                                      },
                                      items: <String>['Male', 'Female', 'Both']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 5,
                                      ),
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            setState(() {
                                              _futureUserUpdate = updateUser(
                                                _idUser,
                                                _name,
                                                _last_name,
                                                _email,
                                                _selected_preference,
                                                _selected_sex,
                                                _age,
                                                _description,
                                              );
                                            });
                                          }
                                        },
                                        child: Icon(Icons.save),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        Text("${snapshot.error}")
                      ],
                    ),
                  );
                }
                // By default, show a loading spinner.
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                );
              },
            )
          : FutureBuilder<Map<String, dynamic>>(
              future: _futureUserUpdate,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('Bien hecho: ' + snapshot.data.toString());
                  Get.back();
                  /*return Center(
                    child: Column(
                      children: [
                        Text(snapshot.data.toString()),
                        //Aquí voy a agregar un formulario para agregar las imagenes
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
                          child: Text('Continue'),
                          onPressed: () {
                            Get.back();
                          },
                        )
                      ],
                    ),
                  );*/
                } else if (snapshot.hasError) {
                  print('Mal hecho: ' + snapshot.error.toString());
                  return Center(
                    child: Column(
                      children: [
                        Text("${snapshot.error}"),
                        SizedBox(
                          height: 50,
                        ),
                        Text("Could not update user. Please try again"),
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
                          child: Text('Try later'),
                          onPressed: () {
                            Get.back();
                          },
                        )
                      ],
                    ),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
    );
  }
}

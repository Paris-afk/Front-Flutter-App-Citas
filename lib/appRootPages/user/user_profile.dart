import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:citas_proyecto/main.dart';
import 'package:citas_proyecto/widgets/get_user_hobbies.dart';
import 'edit profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'request/fetchUser.dart';
import 'dart:io';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  List hobbieList = [];
  final userJWTcontroller = Get.put(UserJWT());

  Future<Map<String, dynamic>> futureUser;
  Future<List> futureHobbies;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
    futureUser.then((value) {
      futureHobbies =
          fetchUserHobbies(userJWTcontroller.data['id_user'].toString());
      futureHobbies.then((values) {
        for (var hobby in values) {
          hobbieList.add(hobby['description']);
        }
        print('TUS HOBBIES: ' + hobbieList.toString());
      });
    });
  }

  onGoBack(dynamic value) {
    setState(() {
      futureUser = fetchUser();
    });
  }

  String preferencesText(int sexualPreference) {
    if (sexualPreference == 1) {
      return 'Men';
    } else if (sexualPreference == 2) {
      return 'Women';
    } else {
      return 'Both sexes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data['profile_picture'].split('\\').last.toString());
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 1.5,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                          'http://10.0.2.2:3000/api/image/profile/' +
                              snapshot.data['profile_picture']
                                  .split('\\')
                                  .last
                                  .toString(),
                          headers: {
                            HttpHeaders.authorizationHeader:
                                "Bearer " + userJWTcontroller.jwt.value
                          },
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : CircularProgressIndicator();
                          },
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(200)),
                          child: Text(
                            snapshot.data['age'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    snapshot.data['name'] + '\n' + snapshot.data['lastname'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    snapshot.data['description'],
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.email),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                snapshot.data['email'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.wc),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                (snapshot.data['id_genre'] == 1)
                                    ? 'Sex: Male'
                                    : 'Sex: Female',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.people),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Preferences: ' +
                                    preferencesText(
                                        snapshot.data['id_sexual_preference']),
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Show me: ' +
                                    preferencesText(
                                        snapshot.data['id_sexual_preference']),
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.lightbulb_outline),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Hobbies: ',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: futureHobbies,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              child: Wrap(
                                spacing: 8.0, // gap between adjacent chips
                                runSpacing: 4.0, // gap between lines
                                children: <Widget>[
                                  for (var hobby in hobbieList)
                                    Chip(
                                      label: Text(
                                        hobby,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      backgroundColor: Colors.orange,
                                    )
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            Text('Error on getting your hobby list');
                          }

                          return Text('No hobbies');
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow[600]),
                        ),
                        child: Text(
                          'Edit profile',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserEdit()),
                          ).then((value) => onGoBack(value));
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: Text(
                          'Log out',
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Wait'),
                              content:
                                  Text('Are you sure you want to log out?'),
                              actions: [
                                TextButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.off(HomePage());
                                    userJWTcontroller.data({});
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ]);
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
    );
  }
}

import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
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
  String _hobbies = "Rubiks cubes";
  final userJWTcontroller = Get.put(UserJWT());

  Future<Map<String, dynamic>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
    fetchUserImg();
  }

  onGoBack(dynamic value) {
    setState(() {
      futureUser = fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    String token = userJWTcontroller.jwt.value;

    return FutureBuilder<Map<String, dynamic>>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                        child: 
                        Image.file(
                          File(
                            snapshot.data['profile_picture']
                          ),
                        ),
                        /*Image(
                          image: NetworkImage(
                            'http://10.0.2.2:3000/api/image/profile/' +
                                snapshot.data['id_user'].toString(),
                            headers: {
                              "Accept": "application/json",
                              HttpHeaders.authorizationHeader:
                                  "Bearer $token"
                            },
                          ),
                        ),*/
                        /*Image.network(
                          'http://10.0.2.2:3000/api/image/profile/' +
                              snapshot.data['id_user'].toString(),
                          //snapshot.data[0]['picture']['large'],
                          headers: {
                            "Accept": "application/json",
                            HttpHeaders.authorizationHeader:
                                "Bearer " + userJWTcontroller.jwt.value
                          },
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : LinearProgressIndicator();
                          },
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),*/
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
                  //color: Colors.blue,
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
                            Icon(Icons.lightbulb_outline),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Hobbies: ' + _hobbies,
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
                      /*Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.accessibility),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Gender: ' +
                                    snapshot.data['id_genre'].toString(),
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.people),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                (snapshot.data['id_sexual_preference'] == 1)
                                    ? 'Preferences: Men'
                                    : 'Preferences: Women',
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
                                (snapshot.data['id_sexual_preference'] == 1)
                                    ? 'Show me: Men'
                                    : 'Show me: Women',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          print('Moving to edit your profile');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserEdit()),
                          ).then((value) => onGoBack(value));
                        },
                      )
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

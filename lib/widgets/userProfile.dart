import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:citas_proyecto/widgets/get_user_hobbies.dart';
import 'dart:io';

class UsersProfile extends StatefulWidget {
  final String userId,
      image1,
      name,
      lastname,
      description,
      preferences,
      age,
      sex,
      image2;
  final List<dynamic> hobbies;

  const UsersProfile({
    required Key key,
    required this.userId,
    required this.image1,
    required this.name,
    required this.lastname,
    required this.description,
    required this.preferences,
    required this.age,
    required this.sex,
    required this.hobbies,
    required this.image2,
  }) : super(key: key);

  _UsersProfile createState() => _UsersProfile();
}

class _UsersProfile extends State<UsersProfile> {
  late Future<List> futureHobbies;
  late List hobbieList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userJWTcontroller = Get.put(UserJWT());

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                userJWTcontroller.backendRootLink +
                    'image/profile/' +
                    widget.image1.split('\\').last.toString(),
                headers: {
                  HttpHeaders.authorizationHeader:
                      "Bearer " + userJWTcontroller.jwt.value
                },
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : Center(child: CircularProgressIndicator());
                },
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                //height: MediaQuery.of(context).size.height,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width + 45,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              widget.name + ' ' + widget.lastname,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.age,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    widget.description,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  'Sex: ' + widget.sex,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Preference: ' + widget.preferences,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                if (widget.hobbies.length == 0)
                  Chip(
                    label: Text(
                      "No hobbies",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange,
                  )
                else
                  for (var hobbie in widget.hobbies)
                    Chip(
                      label: Text(
                        hobbie['description'],
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.orange,
                    ),
              ],
            ),
          ),
          Image.network(
            userJWTcontroller.backendRootLink +
                'image/profile/' +
                widget.image2.split('\\').last.toString(),
            headers: {
              HttpHeaders.authorizationHeader:
                  "Bearer " + userJWTcontroller.jwt.value
            },
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : Center(child: CircularProgressIndicator());
            },
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            //height: MediaQuery.of(context).size.height,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'dart:io';

class UsersProfile extends StatelessWidget {
  final String image1,
      name,
      lastname,
      description,
      preferences,
      age,
      city,
      sex,
      image2;

  const UsersProfile(
      {Key key,
      this.image1,
      this.name,
      this.lastname,
      this.description,
      this.preferences,
      this.age,
      this.city,
      this.sex,
      this.image2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userJWTcontroller = Get.put(UserJWT());

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'http://10.0.2.2:3000/api/image/profile/' +
                    image1.split('\\').last.toString(),
                headers: {
                  HttpHeaders.authorizationHeader:
                      "Bearer " + userJWTcontroller.jwt.value
                },
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : CircularProgressIndicator();
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
                              name + ' ' + lastname,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              age,
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
                    description,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  'City: ' + city,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sex: ' + sex,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Preference: ' + preferences,
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
                Chip(
                    label: Text(
                      'Rubik',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Coffe',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Bondage',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Traveling',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Coding',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
              ],
            ),
          ),
          Image.network(
            'http://10.0.2.2:3000/api/image/profile/' +
                image2.split('\\').last.toString(),
            headers: {
              HttpHeaders.authorizationHeader:
                  "Bearer " + userJWTcontroller.jwt.value
            },
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : CircularProgressIndicator();
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

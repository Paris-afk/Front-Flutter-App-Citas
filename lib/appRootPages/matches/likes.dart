import 'dart:io';

import 'package:citas_proyecto/appRootPages/matches/gets/getLikes.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Likes extends StatefulWidget {
  Likes({required Key key}) : super(key: key);

  @override
  _Likes createState() => _Likes();
}

class _Likes extends State<Likes> {
  late Future<List<dynamic>> futureLikes;
  final userJWTcontroller = Get.put(UserJWT());

  @override
  void initState() {
    super.initState();
    futureLikes = fetchLikes();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: FutureBuilder<List<dynamic>>(
        future: futureLikes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data?.length);
            print(snapshot.data);
            if (snapshot.data?.length == 0)
              return Center(
                child: Text(
                  'You don\'t have any likes yet',
                  style: TextStyle(fontSize: 20),
                ),
              );
            else
              return GridView.count(
                childAspectRatio: (1 / 1.5),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  for (var tile in snapshot.data!)
                    Container(
                      child: Stack(
                        children: [
                          Image.network(
                            userJWTcontroller.backendRootLink +
                                'image/profile/' +
                                tile['profile_picture'],
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
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 15),
                            child: Container(
                              color: Colors.redAccent,
                              padding: EdgeInsets.all(10),
                              width: 100,
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tile['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    tile['age'].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

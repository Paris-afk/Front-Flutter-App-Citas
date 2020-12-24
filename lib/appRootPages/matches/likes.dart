import 'dart:ffi';

import 'package:citas_proyecto/appRootPages/matches/gets/getLikes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Likes extends StatefulWidget {
  Likes({Key key}) : super(key: key);

  @override
  _Likes createState() => _Likes();
}

class _Likes extends State<Likes> {
  Future<List<dynamic>> futureLikes;

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
            print(snapshot.data);
            return GridView.count(
                childAspectRatio: (1 / 1.5),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  for (var tile in snapshot.data)
                    Container(
                      child: Stack(
                        children: [
                          Image.network(
                            tile['picture']['large'],
                            fit: BoxFit.cover,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 15),
                            child: Container(
                              color: Colors.redAccent,
                              padding: EdgeInsets.all(10),
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tile['name']['first'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    tile['dob']['age'].toString(),
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
                ]);
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

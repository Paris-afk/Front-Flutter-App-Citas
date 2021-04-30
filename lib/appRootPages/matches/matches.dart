import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'gets/getMatches.dart';
import 'package:get/get.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:citas_proyecto/appRootPages/user/request/fetchUser.dart';
import '../../widgets/tile.dart';

class Matches extends StatefulWidget {
  Matches({Key key}) : super(key: key);

  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches> {
  Future<List<dynamic>> futureMatches;
  final userJWTcontroller = Get.put(UserJWT());
  Future<Map<String, dynamic>> futureUser;

  @override
  void initState() {
    super.initState();
    futureMatches = getMatches();
    futureMatches.then((value) => {
      //futureUser = fetchUserById();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<dynamic>>(
        future: futureMatches,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0)
              return Center(
                child: Text(
                  'You don\'t have any match yet',
                  style: TextStyle(fontSize: 20),
                ),
              );

            print(snapshot.data);

            return ListView(
              children: [
                for (var tile in snapshot.data)
                  if( userJWTcontroller.data['id_user'] == tile['id_of_user'])
                    Text(tile['id_of_match'].toString())
                  else
                    Text(tile['id_of_user'].toString())

                  /*UserTile(
                    img: tile['profile_picture'] ?? '1613691970195image_picker4608841315600757623.jpg',
                    name: tile['name'],
                    lastname: tile['lastname'],
                    city: tile['city'] ?? 'Unknown',
                    sex: tile['id_genre'].toString(),
                    age: tile['age'].toString(),
                  ),*/
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

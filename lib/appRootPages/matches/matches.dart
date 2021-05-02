import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'gets/getMatches.dart';
import 'package:get/get.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:citas_proyecto/appRootPages/user/request/fetchUser.dart';
import '../../widgets/tile.dart';

class Matches extends StatefulWidget {
  Matches({
    Key key,
    }) : super(key: key);

  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches> {
  Future<List<dynamic>> futureMatches;
  final userJWTcontroller = Get.put(UserJWT());
  Future<Map<String, dynamic>> futureUser;
  List userList = [];

  @override
  void initState() {
    futureMatches = getMatches();
    futureMatches.then((matches) {
      for(var match in matches){
        if(userJWTcontroller.data['id_user'] == match['id_of_user']){
          futureUser = fetchUserById(match['id_of_match'].toString());
          futureUser.then((value) => {
            setState((){
              userList.add(value);
            })
          });
        } else {
          futureUser = fetchUserById(match['id_of_user'].toString());
          futureUser.then((value) => {
            setState((){
              userList.add(value);
            })
          });
        }
      }
    });
    super.initState();
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
                for (var tile in userList)
                  UserTile(
                    userId: tile['id_user'].toString(),
                    img: tile['profile_picture'] ?? '1613691970195image_picker4608841315600757623.jpg',
                    name: tile['name'],
                    lastname: tile['lastname'],
                    sex: tile['id_genre'].toString(),
                    age: tile['age'].toString(),
                  ),
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

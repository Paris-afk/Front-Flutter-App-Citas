import 'package:flutter/material.dart';
import 'package:citas_proyecto/widgets/get_user_hobbies.dart';
import 'package:citas_proyecto/appRootPages/user/request/fetchUser.dart';
import 'package:flutter/widgets.dart';

import '../userProfile.dart';

class ChatProfile extends StatefulWidget {
  final String userId;
  ChatProfile({
    Key key,
    this.userId,
  }) : super(key: key);

  @override
  _ChatProfile createState() => _ChatProfile();
}

class _ChatProfile extends State<ChatProfile> {
  Future<Map<String, dynamic>> futureUser;
  Future<List> futureHobbies;
  List hobbieList = [];

  String preferencesText(int sexualPreference ){
    if(sexualPreference == 1){
      return 'Men';
    } else if(sexualPreference == 2){
      return 'Women';
    } else {
      return 'Both sexes';
    }
  }

  @override
  void initState() {
    super.initState();
    futureUser = fetchUserById(widget.userId);
    futureUser.then((value) {
      futureHobbies = fetchUserHobbies(widget.userId);
      futureHobbies.then((values) {
        for (var hobby in values) {
          setState(() {
            hobbieList.add(hobby);
          });
        }
        print('SUS HOBBIES: ' + hobbieList.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.toString());
            print('ALAVERGA: ' + hobbieList.toString());
            return UsersProfile(
              userId: snapshot.data['id_user'].toString(),
              image1: snapshot.data['profile_picture'] ??
                  '1613691970195image_picker4608841315600757623.jpg',
              name: snapshot.data['name'],
              lastname: snapshot.data['lastname'],
              description: snapshot.data['description'] ??
                  '1613691970195image_picker4608841315600757623.jpg',
              preferences: preferencesText(snapshot.data['sexual_preference']),
              age: snapshot.data['age'].toString(),
              sex: (snapshot.data['id_genre'] == 1)
                                    ? 'Male'
                                    : 'Female',
              hobbies: hobbieList ??
                  [
                    {"description": 'No hobbies'}
                  ],
              image2: snapshot.data['profile_picture'] ??
                  '1613691970195image_picker4608841315600757623.jpg',
            );
            //return Text('Perfil cargado');
          } else if (snapshot.hasError) {
            return Text('Error on loading profile');
          }

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
      ),
    );
  }
}

import 'dart:io';

import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat/chatLayout.dart';

class UserTile extends StatefulWidget {
  final String name, lastname, sex, age, img;

  UserTile(
      {Key key,
      @required this.name,
      this.lastname,
      this.sex,
      this.age,
      this.img})
      : super(key: key);

  @override
  _UserTile createState() => _UserTile();
}

class _UserTile extends State<UserTile> {
  final userJWTcontroller = Get.put(UserJWT());
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.network(
          userJWTcontroller.backendRootLink + 'image/profile/' +
              widget.img.split('\\').last.toString(),
          headers: {
            HttpHeaders.authorizationHeader:
                "Bearer " + userJWTcontroller.jwt.value
          },
          loadingBuilder: (context, child, progress) {
            return progress == null
                ? child
                : Center(child: CircularProgressIndicator());
          },
          width: 50,
          fit: BoxFit.cover,
          //height: MediaQuery.of(context).size.height,
        ),
      ),
      title: Text(
        widget.name + ' ' + widget.lastname
        //tile['name']['first'] + ' ' + tile['name']['last']
        ,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sex: ' + widget.sex),
          Text('Age: ' + widget.age),
          /*
          Text('City: ' + tile['location']['city']),
          Text('Sex: ' + tile['gender']),
          Text('Age: ' + tile['dob']['age'].toString()),*/
        ],
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Chat()));
      },
    );
  }
}

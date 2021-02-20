import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class User {
  final String jwt;
  final Map data;

  User({this.jwt, this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      jwt: json['body'][0],
      data: json['body'][1],
    );
  }
}

Future<User> getUserLogin(String email, String password) async {
  final userJWTcontroller = Get.put(UserJWT());
  final http.Response response = await http.post(
    'http://10.0.2.2:3000/api/auth/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );
  if (response.statusCode == 200) {
    var user = User.fromJson(jsonDecode(response.body));
    

    userJWTcontroller.jwt.value = user.jwt.toString();
    userJWTcontroller.data.addAll(user.data);
    print('User JWT: ' + userJWTcontroller.jwt.value + '   with data: ' + userJWTcontroller.data['id_user'].toString());

    return user;
  } else {
    print('STATUS FAILED: ' + response.statusCode.toString());
    throw Exception('Failed to log in');
  }
}

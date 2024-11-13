import 'package:http/http.dart' as http;
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'dart:convert';
import 'package:get/get.dart';

class User {
  final String jwt;
  final Map data;

  User({required this.jwt, required this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      jwt: json['body'][1]['token'],
      data: json['body'][0],
    );
  }
}

Future<User> createUser(
    String name,
    String lastname,
    String email,
    String password,
    int sexual_preference,
    int genre,
    int age,
    String description) async {
  final userJWTcontroller = Get.put(UserJWT());
  final http.Response response = await http.post(
    Uri.parse(userJWTcontroller.backendRootLink + 'user/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        'name': name,
        'lastname': lastname,
        'email': email,
        'password': password,
        'sexual_preference': sexual_preference,
        'genre': genre,
        'age': age,
        'description': description
      },
    ),
  );
  if (response.statusCode == 200) {
    print(response.body.toString());
    var user = User.fromJson(jsonDecode(response.body));

    userJWTcontroller.jwt.value = user.jwt.toString();
    userJWTcontroller.data.addAll(user.data);
    print(userJWTcontroller.jwt.value);
    //return User.fromJson(jsonDecode(response.body));
    return user;
  } else {
    throw Exception('Failed to post user');
  }
}

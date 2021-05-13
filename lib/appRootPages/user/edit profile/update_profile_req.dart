import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';

Future<Map<String, dynamic>> updateUser(
    int idUser,
    String name,
    String lastname,
    String email,
    int sexual_preference,
    int genre,
    int age,
    String description) async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  final response = await http.put(
    Uri.parse('http://10.0.2.2:3000/api/user/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer $token"
    },
    body: jsonEncode(<String, dynamic>{
      'id': idUser.toString(),
      'name': name,
      'lastname': lastname,
      'email': email,
      'sexual_preference': sexual_preference,
      'genre': genre,
      'age': age,
      'description': description
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']['rows'][0]);
    return post['body']['rows'][0];
  } else {
    print(response.statusCode);
    throw Exception('Failed to load your profile');
  }
}

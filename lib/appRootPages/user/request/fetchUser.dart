import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';

Future<Map<String, dynamic>> fetchUser() async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  final response = await http.get(
    userJWTcontroller.backendRootLink + 
    'user/' + userJWTcontroller.data['id_user'].toString(),
    headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']['rows'][0]);

    userJWTcontroller.preference.value = post['body']['rows'][0]['id_sexual_preference'];

    return post['body']['rows'][0];
  } else {
    print(response.statusCode);
    throw Exception('Failed to load your profile');
  }
}

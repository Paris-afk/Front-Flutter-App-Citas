import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';

Future<List<dynamic>> getHobbiesList() async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  final response = await http.get(
    'http://10.0.2.2:3000/api/user/hobbies',
    headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']['rows']);
    return post['body']['rows'];
  } else {
    print(response.statusCode);
    throw Exception('Failed to load your profile');
  }
}

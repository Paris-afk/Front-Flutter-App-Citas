import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';

Future<List> fetchUserHobbies(String userId) async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  final response = await http.get(
    Uri.parse(userJWTcontroller.backendRootLink + 'user/hobbies/' +
        userId),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer $token"
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']);
    return post['body'];
  } else {
    print(response.statusCode);
    throw Exception('Failed to get your hobby list');
  }
}

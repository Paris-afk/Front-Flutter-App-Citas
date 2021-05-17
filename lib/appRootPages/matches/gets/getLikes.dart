import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';

Future<List<dynamic>> fetchLikes() async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  String userId = userJWTcontroller.data['id_user'].toString();

  final response = await http.get(
    Uri.parse(userJWTcontroller.backendRootLink + 'user/likes/' + userId),
    headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']['rows']);
    return post['body']['rows'].reversed.toList();
  } else {
    throw Exception('Failed to load likes');
  }
}

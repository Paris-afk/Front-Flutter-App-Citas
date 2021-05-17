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
    Uri.parse(userJWTcontroller.backendRootLink + 'user/hobbies'),
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

Future postHobbies(List hobbiesList) async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  final response = await http.post(
    Uri.parse(userJWTcontroller.backendRootLink + 'user/hobbies'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer $token"
    },
    body: jsonEncode(
      <String, dynamic>{
        'idUser': userJWTcontroller.data['id_user'].toString(),
        'hobbies': hobbiesList,
      },
    ),
  );

  if (response.statusCode == 200) {
    print(response.body.toString());

    return 'success';
  } else {
    throw Exception('Failed to post user');
  }
}

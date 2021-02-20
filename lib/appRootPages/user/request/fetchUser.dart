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
    'http://10.0.2.2:3000/api/user/' + userJWTcontroller.data['id_user'].toString(),
    headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
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

Future fetchUserImg() async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  final response = await http.get(
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.xatakawindows.com%2Faplicaciones-windows%2Fquieres-recuperar-el-boton-para-ver-imagenes-en-chrome-esta-extension-te-permite-volver-a-habilitarlo&psig=AOvVaw1CFWhy9MUtAFX8VHECGg4b&ust=1612589854535000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCWiL6D0u4CFQAAAAAdAAAAABAD',
    headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  );

  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> post = jsonDecode(response.body);
    print('IMAGEN OBTENIDA: ' + post['body']['rows'][0].toString());
    return ;
  } else {
    print(response.statusCode);
    throw Exception('Failed to load your profile');
  }
}

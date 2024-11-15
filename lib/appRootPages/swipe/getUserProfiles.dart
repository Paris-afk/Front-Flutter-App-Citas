import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'dart:io';

Future<List<dynamic>> fetchUserProfiles() async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;

  final response = await http.patch(
    Uri.parse(userJWTcontroller.backendRootLink +
    'user/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer $token",
    },
    body: jsonEncode(
      <String, dynamic>{
        'id': userJWTcontroller.data['id_user'].toString(),
        "userType": userJWTcontroller.userType ?? "Extrovertida",
        "idSexualPreference": userJWTcontroller.preference.toString()
      },
    ),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body'].reversed.toList());
    return post['body'];
  } else {
    throw Exception('Could not find user profiles');
  }
}

Future actionForUserProfile(String type, String likedUserId) async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value, url, actionMsg;

  if (type == 'like') {
    actionMsg = 'DISTE UN LIKE: ';
    url = userJWTcontroller.backendRootLink + 'user/likes/';
  } else {
    actionMsg = 'PASASTE A ESTA PERSONA: ';
    url = userJWTcontroller.backendRootLink + 'user/dislikes/';
  }

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer $token",
    },
    body: jsonEncode(
      <String, dynamic>{
        'id': userJWTcontroller.data['id_user'].toString(),
        'idReceptor': likedUserId,
      },
    ),
  );

  if (response.statusCode == 200) {
    var likePost = jsonDecode(response.body);
    print(actionMsg + likePost.toString());
  } else {
    throw Exception('Could not find user profiles');
  }
}

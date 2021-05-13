import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> getMatches() async {
  final userJWTcontroller = Get.put(UserJWT());
  final response = await http.get(
    Uri.parse(userJWTcontroller.backendRootLink +
        'matches/' +
        userJWTcontroller.data['id_user'].toString()),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return User.fromJson(jsonDecode(response.body));
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']['rows']);
    return post['body']['rows'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load matches');
  }
}

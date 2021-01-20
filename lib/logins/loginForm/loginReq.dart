import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String jwt;

  User({this.jwt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      jwt: json['jwt'],
    );
  }
}

Future<User> getUserLogin(String email, String password) async {
  final queryParameters = {
    'email': email,
    'password': password,
  };
  final uri = Uri.http('10.0.2.2:3000', '/api/auth/login', queryParameters);
  //final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  //final response = await http.get(uri, headers: headers);

  final http.Response response = await http.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print(response.body.toString());
    return User.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode.toString());
    throw Exception('Failed to log in');
  }
}

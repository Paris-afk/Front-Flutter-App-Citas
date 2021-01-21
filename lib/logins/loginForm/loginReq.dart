import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String jwt;

  User({this.jwt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      jwt: json['body'],
    );
  }
}

Future<User> getUserLogin(String email, String password) async {
  print(email + ' ' + password);
  final http.Response response = await http.post(
    'http://192.168.56.1:3000/api/auth/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password
    }),
  );
  if (response.statusCode == 200) {
    var user = User.fromJson(jsonDecode(response.body));
    print(user.jwt);
    return user;
  } else {
    print('STATUS FAILED: ' + response.statusCode.toString());
    throw Exception('Failed to log in');
  }
}

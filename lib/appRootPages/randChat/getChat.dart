import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final String lastname;
  final String date_birth;

  User({this.name, this.lastname, this.date_birth});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['command'],
      lastname: json['rowCount'],
      date_birth: json['rows'],
    );
  }
}

Future<List<dynamic>> fetchUser() async {
  final response = await http.get('http://10.0.2.2:3000/api/user/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return User.fromJson(jsonDecode(response.body));
    Map<String, dynamic> post = jsonDecode(response.body);
    return post['body']['rows'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

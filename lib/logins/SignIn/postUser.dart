import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final String lastname;
  final String email;
  final String password;
  final int sexual_preference;
  final int genre;
  final int age;
  final String description;

  User({
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.sexual_preference,
    this.genre,
    this.age,
    this.description,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      sexual_preference: json['sexual_preference'],
      genre: json['genre'],
      age: json['age'],
      description: json['description'],
    );
  }
}

Future<User> createUser(
    String name,
    String lastname,
    String email,
    String password,
    int sexual_preference,
    int genre,
    int age,
    String description) async {
  final http.Response response = await http.post(
    'http://10.0.2.2:3000/api/user/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'sexual_preference': sexual_preference,
      'genre': genre,
      'age': age,
      'description': description
    }),
  );
  if (response.statusCode == 200) {
    print(response.body.toString());
    //return User.fromJson(jsonDecode(response.body));
    return User(name: 'User Created');
  } else {
    throw Exception('Failed to post user');
  }
}

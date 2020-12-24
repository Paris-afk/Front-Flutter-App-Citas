import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchLikes() async {
  final response = await http.get('https://randomuser.me/api/?results=30');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return User.fromJson(jsonDecode(response.body));
    Map<String, dynamic> post = jsonDecode(response.body);
    return post['results'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load likes');
  }
}

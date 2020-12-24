import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchUser() async {
  final response = await http.get('https://randomuser.me/api/');

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    return post['results'];
  } else {
    throw Exception('Failed to load your profile');
  }
}

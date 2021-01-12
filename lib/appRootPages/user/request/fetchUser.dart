import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchUser() async {
  final response = await http.get('http://10.0.2.2:3000/api/user/43');

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    return post['body']['rows'][0];
  } else {
    throw Exception('Failed to load your profile');
  }
}

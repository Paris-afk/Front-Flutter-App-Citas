import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchUserProfiles() async {
  final response = await http.get('https://randomuser.me/api/?results=5');

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    return post['results'];
  } else {
    throw Exception('Could not find user profile');
  }
}

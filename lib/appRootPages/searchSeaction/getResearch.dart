import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchUsers() async {
  final response = await http.get('https://randomuser.me/api/?results=100');

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['results']);
    return post['results'];
  } else {
    throw Exception('Could not find any user');
  }
}

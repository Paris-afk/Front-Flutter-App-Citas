import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchUserProfiles() async {
  final response = await http.get('http://10.0.2.2:3000/api/user/');

  if (response.statusCode == 200) {
    Map<String, dynamic> post = jsonDecode(response.body);
    print(post['body']['rows']);
    return post['body']['rows'];
  } else {
    throw Exception('Could not find user profiles');
  }
}

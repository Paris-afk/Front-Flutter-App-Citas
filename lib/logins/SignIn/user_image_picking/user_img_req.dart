import 'package:http/http.dart' as http;
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'dart:io';

Future postUserProfileImg(File file) async {
  final userJWTcontroller = Get.put(UserJWT());
  String token = userJWTcontroller.jwt.value;
  http.MultipartFile multipartFile;

  var uri = Uri.parse('http://10.0.2.2:3000/api/image/');

  var request = http.MultipartRequest("PATCH", uri);
  request.headers.addAll(
    {
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    },
  );

  // multipart that takes file.. here this "id" is a key of the API request
  request.fields['id'] = userJWTcontroller.data['id_user'].toString();

  // multipart that takes file.. here this "picture" is a key of the API request
  multipartFile = await http.MultipartFile.fromPath(
    'picture',
    file.path,
    filename: basename(file.path),
    contentType: new MediaType('image', 'jpg'),
  );

  print(multipartFile.filename.toString());

  request.files.add(multipartFile);

  var response = await request.send();
  if (response.statusCode == 200) {
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    return 'Everything alright, let\'s meet people!';
  } else {
    throw Exception('Failed to post user');
  }
}

import 'package:get/get.dart';

class UserJWT extends GetxController{
  final RxString jwt = "".obs;
  final RxMap data = {}.obs;
  final String backendRootLink = "http://10.0.2.2:3000/api/";
}
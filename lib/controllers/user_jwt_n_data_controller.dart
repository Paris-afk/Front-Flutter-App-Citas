import 'package:get/get.dart';

class UserJWT extends GetxController{
  final RxString jwt = "".obs;
  RxMap data = {}.obs;
  RxInt preference = 0.obs;
  final userType = "".obs;
  final String backendRootLink = 'https://proyecto-citas-node-backend.herokuapp.com/api/';
}
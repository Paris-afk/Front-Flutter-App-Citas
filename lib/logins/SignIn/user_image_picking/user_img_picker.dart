import 'package:citas_proyecto/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserImgPicker extends StatefulWidget {
  UserImgPicker({Key key}) : super(key: key);

  @override
  _UserImgPicker createState() => _UserImgPicker();
}

class _UserImgPicker extends State<UserImgPicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Here you will post your image'),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.redAccent;
                  return Colors
                      .deepOrangeAccent; // Use the component's default.
                },
              ),
            ),
            child: Text('Log in'),
            onPressed: () {
              Get.off(HomePage());
            },
          )
        ],
      ),
    );
  }
}

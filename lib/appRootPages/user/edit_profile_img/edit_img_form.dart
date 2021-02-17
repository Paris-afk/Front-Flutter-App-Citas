import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'dart:io';
import 'package:get/get.dart';

class EditProfileImg extends StatefulWidget {
  @override
  _EditProfileImg createState() => _EditProfileImg();
}

class _EditProfileImg extends State<EditProfileImg> {
  final userJWTcontroller = Get.put(UserJWT());
  File _image;
  final picker = ImagePicker();
  var _pickImageError;

  Future getImage() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print('Image error: ' + _pickImageError);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile image'),
      ),
      body: Center(
        child: (_image == null)
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.network(
                      'http://10.0.2.2:3000/api/image/profile/' +
                          userJWTcontroller.data['profile_picture']
                              .split('\\')
                              .last
                              .toString(),
                      headers: {
                        HttpHeaders.authorizationHeader:
                            "Bearer " + userJWTcontroller.jwt.value
                      },
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : CircularProgressIndicator();
                      },
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 2.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: getImage,
                    label: Text('Choose new image'),
                    icon: Icon(Icons.image_search),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.file(
                      _image,
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 2.5,
                    ),
                  ),
                  FloatingActionButton.extended(
                    //onPressed: getImage,
                    label: Text('Save'),
                    icon: Icon(Icons.save),
                  ),
                ],
              ),
      ),
    );
  }
}

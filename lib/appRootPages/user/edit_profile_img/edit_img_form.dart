import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:citas_proyecto/logins/SignIn/user_image_picking/user_img_req.dart';

class EditProfileImg extends StatefulWidget {
  final String imgName;

  const EditProfileImg({Key key, this.imgName}) : super(key: key);

  @override
  _EditProfileImg createState() => _EditProfileImg();
}

class _EditProfileImg extends State<EditProfileImg> {
  final userJWTcontroller = Get.put(UserJWT());
  File _image;
  final picker = ImagePicker();
  var _pickImageError;
  Future postImg = null;

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
                      userJWTcontroller.backendRootLink + 'image/profile/' +
                          widget.imgName,
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
            : (postImg == null)
                ? Column(
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
                        onPressed: () {
                          setState(() {
                            postImg = postUserProfileImg(_image);
                            print('IMAGEN YA POSTEADA ALV: ' +
                                postImg.toString());
                          });
                        },
                        label: Text('Save'),
                        icon: Icon(Icons.save),
                      ),
                    ],
                  )
                : FutureBuilder(
                    future: postImg,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Get.back();
                      } else if (snapshot.hasError) {
                        print('Mal hecho: ' + snapshot.error.toString());
                        return Center(
                          child: Column(
                            children: [
                              //Text("${snapshot.error}"),
                              SizedBox(
                                height: 50,
                              ),
                              Text("Could not change image. Please try again"),
                              SizedBox(
                                height: 20,
                              ),
                              FloatingActionButton.extended(
                                onPressed: () {
                                  Get.back();
                                },
                                label: Text('Try later'),
                                icon: Icon(Icons.arrow_back),
                              ),
                            ],
                          ),
                        );
                      }

                      return Center(child: CircularProgressIndicator());
                    },
                  ),
      ),
    );
  }
}

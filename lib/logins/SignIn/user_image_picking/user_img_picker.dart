import 'package:citas_proyecto/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';
import './user_img_req.dart';
import 'package:citas_proyecto/appRootPages/rootLayout.dart';
import '../hobbies_picker/hobbies_picker.dart';

class UserImgPicker extends StatefulWidget {
  UserImgPicker({required Key key}) : super(key: key);

  @override
  _UserImgPicker createState() => _UserImgPicker();
}

class _UserImgPicker extends State<UserImgPicker> {
  late File _image;
  final picker = ImagePicker();
  var _pickImageError;
  Future<dynamic>? postImg;

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
    return Center(
      child: (_image == null)
          ? Column(
              children: [
                Text('Now let people see you'),
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
                  child: Text('Upload image'),
                  onPressed: getImage,
                )
              ],
            )
          : (postImg == null)
              ? Column(
                  children: [
                    Image.file(_image),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.redAccent;
                            return Colors
                                .deepOrangeAccent; // Use the component's default.
                          },
                        ),
                      ),
                      child: Text('Continue'),
                      onPressed: () {
                        setState(() {
                          postImg = postUserProfileImg(_image);
                          postImg?.then((value) {
                            if (value.toString() == 'success') {
                              HobbiesPicker(key: UniqueKey());
                            }
                          });
                        });
                        //Get.off(HomePage());
                      },
                    )
                  ],
                )
              : FutureBuilder(
                  future: postImg,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('IMAGE POSTED');
                      return HobbiesPicker(key: UniqueKey());
                    } else if (snapshot.hasError) {
                      print('Mal hecho: ' + snapshot.error.toString());
                      return Center(
                        child: Column(
                          children: [
                            Text("${snapshot.error}"),
                            SizedBox(
                              height: 50,
                            ),
                            Text("Could not create user. Please try again"),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors.redAccent;
                                    return Colors
                                        .deepOrangeAccent; // Use the component's default.
                                  },
                                ),
                              ),
                              child: Text('Try later'),
                              onPressed: () {
                                Get.off(HomePage());
                              },
                            )
                          ],
                        ),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserEdit extends StatefulWidget{
  @override
  _UserEdit createState() => _UserEdit();

}

class _UserEdit extends State<UserEdit>{
  final _profileImage = 'https://picsum.photos/500';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors:[
                      Colors.orange[900],
                      Colors.orange[400]
                    ]
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 60,),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.network(_profileImage),
                            FloatingActionButton(
                              backgroundColor: Colors.orange,
                              onPressed: (){
                                print('Editing image');
                              },
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Hobbies",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Sex",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Preferences",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Show me",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.save),
                          onPressed: (){
                            print('Info changed');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 65,),
              ],
            ),
          ),
      ),
    );
  }

}
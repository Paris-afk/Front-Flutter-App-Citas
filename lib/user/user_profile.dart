import 'package:citas_proyecto/user/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  final _profileImage = 'https://picsum.photos/500';
  final _age = "19";
  final _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tristique a ligula vel interdum. Vestibulum lacus diam, ultricies dignissim ligula at, ultricies laoreet metus. Pellentesque volutpat justo sapien, nec vestibulum diam fermentum sit amet. Aenean a diam risus. Pellentesque non ligula ac erat fringilla vehicula. Donec quis enim non ipsum elementum mollis id et velit. Maecenas non augue nulla. Curabitur est orci, scelerisque interdum nulla ac, congue dictum justo. Proin ornare tellus vel metus bibendum faucibus. Praesent eu mauris felis. Nulla in nibh sollicitudin, interdum justo ut, aliquet dolor. Aenean tempor neque ipsum, ac gravida justo venenatis pulvinar. Praesent ac velit eget justo tristique viverra quis eu lectus. ";
  final _email = "yassinovp@gmail.com";
  final _hobbies = "Rubiks cubes";
  final _sex = "Men";
  final _gender = "Hetero";
  final _preferences = "Woman";
  final _showMe = "Woman";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Container(
              height: MediaQuery.of(context).size.width / 2,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(
                      _profileImage,
                      fit: BoxFit.cover,
                    ),

                  ),
                ],
              ),

            ),
            SizedBox(height: 60,),
            Container(
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Text(
                'Juan Perez',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Text(
                _description,
                textAlign: TextAlign.justify,
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              //color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Email: ' + _email,
                            style: TextStyle(
                                fontSize: 22
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(Icons.lightbulb_outline),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Hobbies: ' + _hobbies,
                            style: TextStyle(
                                fontSize: 22
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(Icons.wc),
                        Container(
                          margin: EdgeInsets.only(left:15),
                          child: Text(
                            'Sex: ' + _sex,
                            style: TextStyle(
                                fontSize: 22
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(Icons.accessibility),
                        Container(
                          margin: EdgeInsets.only(left:15),
                          child: Text(
                            'Gender: ' + _gender,
                            style: TextStyle(
                                fontSize: 22
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(Icons.people),
                        Container(
                            margin: EdgeInsets.only(left:15),
                            child:  Text(
                              'Preferences: ' + _preferences,
                              style: TextStyle(
                                  fontSize: 22
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Container(
                          margin: EdgeInsets.only(left:15),
                          child: Text(
                            'Show me: ' + _showMe,
                            style: TextStyle(
                                fontSize: 22
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      print('Moving to edit your profile');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserEdit()
                          ),
                      );
                    },
                  )
                ],
              ),
            )
          ]
        ),
        //Image asset an then the list of data of the user
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        backgroundColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon, color: Colors.white,),
            title: Text('Match', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.white,),
            title: Text('RandChat', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white,),
            title: Text('Search', style: TextStyle(color: Colors.white),),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white,),
            title: Text('Search', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.white,),
            title: Text('Swipes', style: TextStyle(color: Colors.white),),
          ),*/
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  final _profileImage = 'https://picsum.photos/500';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: NetworkImage(_profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                            'Email: ',
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
                            'Hobbies: ',
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
                            'Sex: ',
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
                              'Preferences: ',
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
                            'Show me: ',
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
                      print('Moving to Edit Profile');
                    },
                  )
                ],
              ),
            )
          ]
        ),
        //Image asset an then the list of data of the user
      ),
    );
  }
}

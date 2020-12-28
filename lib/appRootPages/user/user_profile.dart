import './edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'request/fetchUser.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  String _description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tristique a ligula vel interdum. Vestibulum lacus diam, ultricies dignissim ligula at, ultricies laoreet metus. Pellentesque volutpat justo sapien, nec vestibulum diam fermentum sit amet. Aenean a diam risus. Pellentesque non ligula ac erat fringilla vehicula. Donec quis enim non ipsum elementum mollis id et velit. Maecenas non augue nulla. Curabitur est orci, scelerisque interdum nulla ac, congue dictum justo. Proin ornare tellus vel metus bibendum faucibus. Praesent eu mauris felis. Nulla in nibh sollicitudin, interdum justo ut, aliquet dolor. Aenean tempor neque ipsum, ac gravida justo venenatis pulvinar. Praesent ac velit eget justo tristique viverra quis eu lectus. ";
  String _hobbies = "Rubiks cubes";

  Future<List<dynamic>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 1.5,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                          snapshot.data[0]['picture']['large'],
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(200)),
                          child: Text(
                            snapshot.data[0]['dob']['age'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.blue,
                  child: Text(
                    snapshot.data[0]['name']['first'] +
                        ' ' +
                        snapshot.data[0]['name']['last'],
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
                                snapshot.data[0]['email'],
                                style: TextStyle(fontSize: 20),
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
                                style: TextStyle(fontSize: 22),
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Sex: ' + snapshot.data[0]['gender'],
                                style: TextStyle(fontSize: 22),
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Gender: ' + snapshot.data[0]['gender'],
                                style: TextStyle(fontSize: 22),
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Preferences: ' + snapshot.data[0]['gender'],
                                style: TextStyle(fontSize: 22),
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
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                'Show me: ' + snapshot.data[0]['gender'],
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          print('Moving to edit your profile');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserEdit()),
                          );
                        },
                      )
                    ],
                  ),
                )
              ]);
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Text("${snapshot.error}")
              ],
            ),
          );
        }
        // By default, show a loading spinner.
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'getUserProfiles.dart';
import '../../widgets/userProfile.dart';

class Swipes extends StatefulWidget {
  Swipes({Key key}) : super(key: key);

  @override
  _Swipes createState() => _Swipes();
}

class _Swipes extends State<Swipes> {
  Future<List<dynamic>> futureProfiles;

  @override
  void initState() {
    super.initState();
    futureProfiles = fetchUserProfiles();
  }

  void swipeRight() {
    futureProfiles.then((value) => {value});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 28,
        ),
        Center(
          child: FutureBuilder<List<dynamic>>(
            future: futureProfiles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    for (var user in snapshot.data.reversed)
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width + 150,
                          child: UsersProfile(
                            image1: user['picture']['large'],
                            name: user['name']['first'],
                            lastname: user['name']['last'],
                            age: user['dob']['age'].toString(),
                            city: user['location']['city'],
                            sex: user['gender'],
                            image2: user['picture']['large'],
                          ),
                        ),
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width + 150,
                    child: Center(child: Text("${snapshot.error}")),
                  ),
                );
              }
              return Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width + 150,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
                child: Icon(Icons.close),
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  print("Swipe left");
                }),
            FloatingActionButton(
                child: Icon(Icons.settings_backup_restore),
                onPressed: () {
                  print("Sorry, I fucked up... Go back");
                }),
            FloatingActionButton(
                child: Icon(Icons.check),
                backgroundColor: Colors.greenAccent,
                onPressed: () {
                  print("Swipe right");
                }),
          ],
        ),
      ],
    );
  }
}

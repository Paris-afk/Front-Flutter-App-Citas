import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'getUserProfiles.dart';
import '../../widgets/userProfile.dart';

class Swipes extends StatefulWidget {
  Swipes({Key key}) : super(key: key);

  @override
  _Swipes createState() => _Swipes();
}

class _Swipes extends State<Swipes> {
  List<dynamic> profiles = [];
  Future<List<dynamic>> futureProfiles;

  @override
  void initState() {
    super.initState();
    futureProfiles = fetchUserProfiles();
    futureProfiles.then((value) => profiles = value);
  }

  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          height: MediaQuery.of(context).size.width + 200,
          child: FutureBuilder<List<dynamic>>(
            future: futureProfiles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print(profiles);
                return TinderSwapCard(
                  swipeUp: false,
                  swipeDown: false,
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: profiles.length,
                  stackNum: 2,
                  swipeEdge: 2.0,
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.width * 2,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: UsersProfile(
                        image1: profiles[index]['profile_picture'] ?? '1613691970195image_picker4608841315600757623.jpg',
                        name: profiles[index]['name'],
                        lastname: profiles[index]['lastname'],
                        description: profiles[index]['description'] ?? '1613691970195image_picker4608841315600757623.jpg',
                        preferences: profiles[index]['id_sexual_preference'].toString(),
                        age: profiles[index]['age'].toString(),
                        city: 'Tabasco',
                        sex: profiles[index]['id_genre'].toString(),
                        image2: profiles[index]['profile_picture'] ?? '1613691970195image_picker4608841315600757623.jpg',
                      ),
                    ),
                  ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < -5) {
                      //Card is LEFT swiping
                      print('SWIPE LEFT');
                    } else if (align.x > 5) {
                      //Card is RIGHT swiping
                      print('SWIPE RIGHT');
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                    if (orientation == CardSwipeOrientation.RIGHT) {
                      print('LIKE');
                      actionForUserProfile('like', profiles[index]['id_user'].toString());
                    } else {
                      print('PASS');
                      actionForUserProfile('dislike', profiles[index]['id_user'].toString());
                    }
                  },
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
                  controller.triggerLeft();
                  print("Swipe left");
                }),
            FloatingActionButton(
                child: Icon(Icons.check),
                backgroundColor: Colors.greenAccent,
                onPressed: () {
                  controller.triggerRight();
                  print("Swipe right");
                }),
          ],
        ),
      ],
    );
  }
}

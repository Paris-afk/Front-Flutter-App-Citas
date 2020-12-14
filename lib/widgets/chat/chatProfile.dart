import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatProfile extends StatefulWidget {
  @override
  _ChatProfile createState() => _ChatProfile();
}

class _ChatProfile extends State<ChatProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://picsum.photos/500/700',
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width - 22,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              'Yassin Orlando',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '21',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'City: Villahermosa',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sex: Male',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit augue urna, sit amet varius ligula fermentum in. Aliquam rhoncus luctus massa vitae feugiat. Morbi sed felis ante. Sed consectetur consectetur quam, ac pulvinar arcu semper vel. Fusce nibh dui, eleifend et viverra in, interdum vestibulum orci. Mauris quis efficitur arcu, non aliquam arcu. Curabitur vitae lectus iaculis nunc congue placerat. Donec feugiat justo quis accumsan venenatis. Maecenas eget quam eget elit luctus congue. Pellentesque aliquet neque enim, ut luctus nisl gravida ut. ',
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Image.network(
            'https://picsum.photos/500/700',
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Hobbies: Rubik, Cafe, Bondage'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

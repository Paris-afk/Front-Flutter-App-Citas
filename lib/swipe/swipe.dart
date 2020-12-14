import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Swipes extends StatefulWidget {
  @override
  _Swipes createState() => _Swipes();
}

class _Swipes extends State<Swipes> {
  @override
  Widget build(BuildContext context) {
    final List<Card> cardList = <Card>[
      Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width + 100,
          child: SingleChildScrollView(
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
          ),
        ),
      ),
      Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width + 100,
          child: SingleChildScrollView(
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
          ),
        ),
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 22,
        ),
        Center(
          child: Stack(
            children: cardList,
          ),
        ),
        SizedBox(
          height: 10,
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

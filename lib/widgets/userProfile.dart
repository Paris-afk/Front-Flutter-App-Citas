import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UsersProfile extends StatelessWidget {
  final String image1, name, lastname, age, city, sex, image2;

  const UsersProfile(
      {Key key,
      this.image1,
      this.name,
      this.lastname,
      this.age,
      this.city,
      this.sex,
      this.image2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                image1,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width + 45,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              name + ' ' + lastname,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              age,
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
                  'City: ' + city,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sex: ' + sex,
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
            image2,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Chip(
                    label: Text(
                      'Rubik',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Coffe',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Bondage',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Traveling',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
                Chip(
                    label: Text(
                      'Coding',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

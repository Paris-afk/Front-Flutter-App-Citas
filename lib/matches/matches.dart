import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Matches extends StatefulWidget{
  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 28,
        ),
        Container(
          width: MediaQuery.of(context).size.width ,
          padding: EdgeInsets.all(20),
          child: Text(
            "Chat with random people near you",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60)
              ),
              color: Colors.redAccent,
          ),
          height: MediaQuery.of(context).size.height/1.2,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Your matches'),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: ListView(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                          'https://picsum.photos/500',
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Yassin Orlando Vazquez Paz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: (){
                        print('Chating with someone');
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
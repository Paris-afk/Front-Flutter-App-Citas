import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/chat/chatLayout.dart';

class Matches extends StatefulWidget {
  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches> {
  final _chats = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        //padding: const EdgeInsets.all(15),
        children: List.generate(
          16,
          (index) => ListTile(
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
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('City: Tabasco'),
                Text('Sex: Male'),
                Text('Age: 21'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chat()));
            },
          ),
        ),
      ),
    );
  }
}

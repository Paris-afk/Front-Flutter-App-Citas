import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../../widgets/chat/chatLayout.dart';
import 'getChat.dart';

class RandChat extends StatefulWidget {
  RandChat({Key key}) : super(key: key);

  @override
  _RandChat createState() => _RandChat();
}

class _RandChat extends State<RandChat> {
  final _chats = <Widget>[];

  Future<List<dynamic>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 130,
          child: FutureBuilder<List<dynamic>>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Text(snapshot.data[0].toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            },
          ),
          /*child: ListView(
              children: List.generate(
                  15,
                  (index) => ListTile(
                        contentPadding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        },
                      ))),*/
        ),
      ],
    );
  }
}

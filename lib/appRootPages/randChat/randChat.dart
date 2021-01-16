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
                //print(snapshot.data);
                return ListView(
                  children: [
                    for (var tile in snapshot.data)
                      ListTile(
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
                          tile['name'] + ' ' + tile['lastname'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('City: Tabasco'),
                            Text('Sex: ' + tile['id_genre'].toString()),
                            Text('Age: ' + tile['age'].toString()),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        },
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}

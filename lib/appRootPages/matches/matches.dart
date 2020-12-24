import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/chat/chatLayout.dart';
import 'gets/getMatches.dart';

class Matches extends StatefulWidget {
  Matches({Key key}) : super(key: key);

  @override
  _Matches createState() => _Matches();
}

class _Matches extends State<Matches> {
  Future<List<dynamic>> futureMatches;

  @override
  void initState() {
    super.initState();
    futureMatches = getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<dynamic>>(
        future: futureMatches,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (var tile in snapshot.data)
                  ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(
                        tile['picture']['thumbnail'],
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      tile['name']['first'] + ' ' + tile['name']['last'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('City: ' + tile['location']['city']),
                        Text('Sex: ' + tile['gender']),
                        Text('Age: ' + tile['dob']['age'].toString()),
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
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

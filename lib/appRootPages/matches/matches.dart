import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'gets/getMatches.dart';
import '../../widgets/tile.dart';

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
                  UserTile(
                    img: tile['picture']['thumbnail'],
                    name: tile['name']['first'],
                    lastname: tile['name']['last'],
                    city: tile['location']['city'],
                    sex: tile['gender'],
                    age: tile['dob']['age'].toString(),
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

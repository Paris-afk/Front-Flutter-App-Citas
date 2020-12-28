import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/tile.dart';
import './getResearch.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _people = [];
  List _placeholder;

  Future<List<dynamic>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
    futureUsers.then((value) {
      _placeholder = value;
    });
  }

  void searchUser(String userName) {
    for (var i = 0; i < _placeholder.length; i++) {
      if (_placeholder[i]['name']['first'] == userName ||
          _placeholder[i]['name']['last'] == userName) {
        //print('Using loop: ${_placeholder[i]}');
        setState(() {
          _people.add(_placeholder[i]);
        });
      }
    }
    print('RESULTADO DE BUSQUEDA: ' + _people.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search for people',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          setState(() {
                            _people = [];
                          });
                          searchUser(value);
                          return 'Searching for:' + value;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          //Process data
                          print('Searching');
                        }
                        return Text('Searching');
                      },
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
            //--////////////////////////////////Results ////////////////////////////////////7
            Container(
              height: MediaQuery.of(context).size.height - 160,
              child: ListView(children: [
                if (_people.length > 0)
                  for (var tile in _people)
                    UserTile(
                      img: tile['picture']['thumbnail'],
                      name: tile['name']['first'],
                      lastname: tile['name']['last'],
                      city: tile['location']['city'],
                      sex: tile['gender'],
                      age: tile['dob']['age'].toString(),
                    )
                else
                  Center(
                    child: Text('No result found'),
                  ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

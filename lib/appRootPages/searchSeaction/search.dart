import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/chat/chatLayout.dart';
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
      if (_placeholder[i]['name']['first'] == userName) {
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
            //----------------Results
            Container(
              height: MediaQuery.of(context).size.height - 160,
              child: ListView(
                  //padding: const EdgeInsets.all(15),
                  children: [
                    if (_people.length > 0)
                      for (var tile in _people)
                        ListTile(
                          contentPadding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Chat()));
                          },
                        )
                    else
                      Center(
                        child: Text('No result found'),
                      ),
                  ]),
              /*child: ListView(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Chat()));
                    },
                  ),
                ),
              ),*/
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './hobbies_req.dart';
import 'package:get/get.dart';
import 'package:citas_proyecto/appRootPages/rootLayout.dart';

class HobbiesPicker extends StatefulWidget {
  HobbiesPicker({Key key}) : super(key: key);

  @override
  _HobbiesPicker createState() => _HobbiesPicker();
}

class _HobbiesPicker extends State<HobbiesPicker> {
  Future<List<dynamic>> _futureGetHobbies;
  List<dynamic> hobbies;
  Future<dynamic> _postingUsers;

  @override
  void initState() {
    super.initState();
    _futureGetHobbies = getHobbiesList();
    _futureGetHobbies.then((values) {
      hobbies = values;

      for (var hobby in hobbies) {
        hobby['active'] = false;
      }

      print(hobbies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _futureGetHobbies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return (_postingUsers == null)
              ? Container(
                  child: Column(
                    children: [
                      Text(
                        'Select your hobbies',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 400,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var hobby in snapshot.data)
                                CheckboxListTile(
                                  title: Text(hobby['description']),
                                  value: hobby['active'],
                                  activeColor: Colors.deepOrangeAccent,
                                  onChanged: (bool value) {
                                    setState(() {
                                      hobby['active'] = !hobby['active'];
                                    });
                                  },
                                )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.redAccent;
                              return Colors
                                  .deepOrangeAccent; // Use the component's default.
                            },
                          ),
                        ),
                        child: Text('Continue'),
                        onPressed: () {
                          setState(() {
                            List<int> selectedHobbies = [];

                            for (var hobby in hobbies) {
                              if (hobby['active']) {
                                selectedHobbies.add(hobby['id_hobbie']);
                              }
                            }
                            print('YOU SELECTED THESE HOBBIES: ' +
                                selectedHobbies.toString());

                            _postingUsers = postHobbies(selectedHobbies);
                            _postingUsers.then((value) {
                              if(value == 'success'){
                                Navigator.pop(context);
                                Get.off(RootLayout());
                              }
                            });
                          });
                        },
                      ),
                    ],
                  ),
                )
              : FutureBuilder(
                  future: _postingUsers,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('All ok');
                    } else if (snapshot.hasError) {
                      return Container(
                        child: Column(
                          children: [
                            Text("${snapshot.error}"),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                                "Could not post your hobbies list. Please try again"),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors.redAccent;
                                    return Colors
                                        .deepOrangeAccent; // Use the component's default.
                                  },
                                ),
                              ),
                              child: Text('Try again'),
                              onPressed: () {
                                setState(() {
                                  _postingUsers = null;
                                  _futureGetHobbies = getHobbiesList();
                                });
                              },
                            )
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text("${snapshot.error}"),
                SizedBox(
                  height: 50,
                ),
                Text("Could not get the hobbies list. Please try again"),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.redAccent;
                        return Colors
                            .deepOrangeAccent; // Use the component's default.
                      },
                    ),
                  ),
                  child: Text('Try again'),
                  onPressed: () {
                    setState(() {
                      _futureGetHobbies = getHobbiesList();
                    });
                  },
                )
              ],
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './hobbies_req.dart';

class HobbiesPicker extends StatefulWidget {
  @override
  _HobbiesPicker createState() => _HobbiesPicker();
}

class _HobbiesPicker extends State<HobbiesPicker> {
  Future<List<dynamic>> _futureGetHobbies;

  @override
  void initState() {
    super.initState();
    _futureGetHobbies = getHobbiesList();
    print(_futureGetHobbies.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _futureGetHobbies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Column(
              children: [
                Text(
                  'Select your hobbies',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var hobby in snapshot.data)
                        Text('Hobby: ' + hobby.toString())
                    ],
                  ),
                ),
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
                  child: Text('Continue'),
                  onPressed: () {
                    /*Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInLayout()));*/
                  },
                )
              ],
            ),
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

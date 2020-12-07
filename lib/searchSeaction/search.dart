import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  final _formKey = GlobalKey<FormState>();
  final _people = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
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
                      child: Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
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
                      subtitle: Text('City: Tabasco'),
                      onTap: () {},
                    ),
                  ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/dropdown.dart';

class UserEdit extends StatefulWidget{
  @override
  _UserEdit createState() => _UserEdit();

}

class _UserEdit extends State<UserEdit>{
  final _profileImage = 'https://picsum.photos/500';
  final _age = '19';
  final _name = 'Juan';
  final _last_name = 'Perez';
  var _description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tristique a ligula vel interdum. Vestibulum lacus diam, ultricies digniss';
  var _email = "yassinovp@gmail.com";
  var _hobbies = ["Reading", "Traveling", "Languages"];
  String _sex = "Male";
  String _gender = 'Masculine';
  String _preferences = 'Women';
  String _dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(_profileImage,
                      width: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    _name + " " + _last_name + " - " + _age,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width ,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                      "Edit your data",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: TextFormField(
                      initialValue: _name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: TextFormField(
                      initialValue: _last_name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: TextFormField(
                      initialValue: _description,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: TextFormField(
                      initialValue: _email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    child: TextFormField(
                      initialValue: _hobbies.join(", "),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hobbies',
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text("Sex"),
                    value: _sex,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newValue) {
                      setState(() {
                        _sex = newValue;
                      });
                    },
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text("Gender"),
                    value: _gender,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newValue) {
                      setState(() {
                        _gender = newValue;
                      });
                    },
                    items: <String>['Masculine', 'Femenine', 'free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text("Preferences"),
                    value: _preferences,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newValue) {
                      setState(() {
                        _preferences = newValue;
                      });
                    },
                    items: <String>['Women', 'Men', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text("Show me"),
                    value: _dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  
                  Builder(
                    builder: (context) => IconButton(
                        icon: Icon(Icons.save),
                        onPressed: ()  {
                          print("Saved changes");
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Changes saved"
                              ),
                            ),
                          );
                          //Navigator.pop(context);
                        }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget{
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("This is the 'Search' section, where you will be able to search profiles of other people "),
      ],
    );
  }
}
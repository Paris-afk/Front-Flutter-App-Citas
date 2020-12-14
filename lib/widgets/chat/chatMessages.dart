import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessages createState() => _ChatMessages();
}

class _ChatMessages extends State<ChatMessages> {
  List<Widget> messages = <Widget>[
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      color: Colors.yellowAccent,
      child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim sem nec magna tincidunt faucibus sagittis eget urna. Nam commodo eu nibh a vehicula. Aliquam mauris velit, molestie sit amet sem a, pellentesque malesuada eros. Phasellus non hendrerit purus. Sed malesuada nisi sit amet mi consequat aliquet. Donec gravida orci nisi, id ornare tortor gravida congue. Praesent sagittis scelerisque aliquet. Fusce sed sodales nisl. Suspendisse et arcu vitae diam condimentum tempus et id augue. Praesent eu imperdiet neque, non congue nibh.'),
    ),
    Chip(label: Text('This is a message')),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: messages,
      ),
    );
  }
}

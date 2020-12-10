import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _Chat extends State<Chat>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.network(
            'https://picsum.photos/500',
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text('Yassín Orlando Vázquez Paz'),
      ),
      body: Center(
        child: Text('Chat'),
      ),
    );
  }
}
import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class ChatMessages extends StatefulWidget {
  final String userId;
  ChatMessages({
    Key key,
    this.userId,
  }) : super(key: key);

  @override
  _ChatMessages createState() => _ChatMessages();
}

class _ChatMessages extends State<ChatMessages> {
  final _formKey = GlobalKey<FormState>();
  String _message = '';
  final userJWTcontroller = Get.put(UserJWT());
  List<Widget> messages = <Widget>[
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      color: Colors.yellowAccent,
      child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim sem nec magna tincidunt faucibus sagittis eget urna. Nam commodo eu nibh a vehicula. Aliquam mauris velit, molestie sit amet sem a, pellentesque malesuada eros. Phasellus non hendrerit purus. Sed malesuada nisi sit amet mi consequat aliquet. Donec gravida orci nisi, id ornare tortor gravida congue. Praesent sagittis scelerisque aliquet. Fusce sed sodales nisl. Suspendisse et arcu vitae diam condimentum tempus et id augue. Praesent eu imperdiet neque, non congue nibh.'),
    ),
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      color: Colors.grey,
      child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim sem nec magna tincidunt faucibus sagittis eget urna. Nam commodo eu nibh a vehicula. Aliquam mauris velit, molestie sit amet sem a, pellentesque malesuada eros. Phasellus non hendrerit purus. Sed malesuada nisi sit amet mi consequat aliquet. Donec gravida orci nisi, id ornare tortor gravida congue. Praesent sagittis scelerisque aliquet. Fusce sed sodales nisl. Suspendisse et arcu vitae diam condimentum tempus et id augue. Praesent eu imperdiet neque, non congue nibh.'),
    ),
    Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      color: Colors.yellowAccent,
      child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim sem nec magna tincidunt faucibus sagittis eget urna. Nam commodo eu nibh a vehicula. Aliquam mauris velit, molestie sit amet sem a, pellentesque malesuada eros. Phasellus non hendrerit purus. Sed malesuada nisi sit amet mi consequat aliquet. Donec gravida orci nisi, id ornare tortor gravida congue. Praesent sagittis scelerisque aliquet. Fusce sed sodales nisl. Suspendisse et arcu vitae diam condimentum tempus et id augue. Praesent eu imperdiet neque, non congue nibh.'),
    ),
    Chip(label: Text('This is a message')),
  ];

  void sendMessage() async {
    FocusScope.of(context).unfocus();

    // await FirebaseApi.uploadMessage(widget.idUser, message)
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: messages,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.deepOrangeAccent,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Say something',
                      ),
                      onChanged: (newMessage){
                        setState(() {
                          _message = newMessage;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.redAccent;
                          return Colors
                              .yellowAccent; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate() && _message != '') {
                        //Process data
                        print('Message sent');
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import '../api_firebase.dart';

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

  void sendMessage(String idUser, String msg) async {
    print('Message sent');
    FocusScope.of(context).unfocus();
    await FirebaseApi.uploadMessage(idUser, widget.userId, msg.trim());
    setState(() {
      _message = '';
      _formKey.currentState.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> messages = <Widget>[
      Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.35,
            minWidth: MediaQuery.of(context).size.width / 1.8,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 4),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            //width: MediaQuery.of(context).size.width / 1.35,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim sem nec magna tincidunt faucibus sagittis eget urna. Nam commodo eu nibh a vehicula. Aliquam mauris velit, molestie sit amet sem a, pellentesque malesuada eros. Phasellus non hendrerit purus. Sed malesuada nisi sit amet mi consequat aliquet. Donec gravida orci nisi, id ornare tortor gravida congue. Praesent sagittis scelerisque aliquet. Fusce sed sodales nisl. Suspendisse et arcu vitae diam condimentum tempus et id augue. Praesent eu imperdiet neque, non congue nibh.',
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.35,
            minWidth: MediaQuery.of(context).size.width / 1.8,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 4),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            //width: MediaQuery.of(context).size.width / 1.35,
            child: Text(
              'Lorem ipsum dolor sit amet.',
              textAlign: TextAlign.left,
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 4),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
          width: MediaQuery.of(context).size.width / 1.35,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dignissim sem nec magna tincidunt faucibus sagittis eget urna. Nam commodo eu nibh a vehicula. Aliquam mauris velit, molestie sit amet sem a, pellentesque malesuada eros. Phasellus non hendrerit purus. Sed malesuada nisi sit amet mi consequat aliquet. Donec gravida orci nisi, id ornare tortor gravida congue. Praesent sagittis scelerisque aliquet. Fusce sed sodales nisl. Suspendisse et arcu vitae diam condimentum tempus et id augue. Praesent eu imperdiet neque, non congue nibh.',
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
    ];

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: ScrollController(
              initialScrollOffset: 0.0,
              keepScrollOffset: true,
            ),
            child: StreamBuilder(
              stream: FirebaseApi.getMessages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data.docs);
                if (snapshot.hasError) {
                  return Text('Something went wrong. Please try again');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.data == null)
                  return Center(child: CircularProgressIndicator());

                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.docs.map<Widget>((document) {
                      var isMe = document.data()['transmitter_id'].toString() ==
                          userJWTcontroller.data['id_user'].toString();
                      print(isMe);

                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.35,
                            minWidth: MediaQuery.of(context).size.width / 1.8,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 3,
                              bottom: 4,
                            ),
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.bottomRight,
                            child: Text(
                              document.data()['content'],
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isMe ? Colors.deepOrangeAccent : Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft:
                                    isMe ? Radius.circular(20.0) : Radius.zero,
                                bottomRight:
                                    !isMe ? Radius.circular(20.0) : Radius.zero,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }

                return Center(child: Text('Say hi to this person'));
              },
            ),
          ),
        ),
        Container(
          color: Colors.deepOrangeAccent,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 65.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextFormField(
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        hintText: 'Say something',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 18,
                          right: 18,
                        ),
                        border: OutlineInputBorder(
                          gapPadding: 10,
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onChanged: (newMessage) {
                        setState(() {
                          _message = newMessage;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          //return 'Please enter some text';
                          return;
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
                        sendMessage(
                            userJWTcontroller.data['id_user'].toString(),
                            _message);
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

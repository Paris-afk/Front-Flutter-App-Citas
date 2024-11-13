import 'package:citas_proyecto/controllers/user_jwt_n_data_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../api_firebase.dart';

class ChatMessages extends StatefulWidget {
  final String userId;
  ChatMessages({
    required Key key,
    required this.userId,
  }) : super(key: key);

  @override
  _ChatMessages createState() => _ChatMessages();
}

class _ChatMessages extends State<ChatMessages> {
  final _formKey = GlobalKey<FormState>();
  String _message = '';
  final userJWTcontroller = Get.put(UserJWT());

  void sendMessage(String idUser, String msg) async {
    FocusScope.of(context).unfocus();
    await FirebaseApi.uploadMessage(idUser, widget.userId, msg.trim());
    _message = '';
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseApi.getMessages().cast<QuerySnapshot<Object?>>(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        snapshot.data!.docs.length - 1 - index;

                    var isMe = snapshot.data != null &&
                        snapshot.data!.docs[reversedIndex]['transmitter_id']
                                .toString() ==
                            userJWTcontroller.data['id_user'].toString();

                    if (snapshot.data != null &&
                        (snapshot.data!.docs[reversedIndex]['transmitter_id']
                                    .toString() ==
                                userJWTcontroller.data['id_user'].toString() ||
                            snapshot.data!.docs[reversedIndex]['receptor_id']
                                    .toString() ==
                                userJWTcontroller.data['id_user'].toString()) &&
                        (snapshot.data!.docs[reversedIndex]['transmitter_id']
                                    .toString() ==
                                widget.userId ||
                            snapshot.data!.docs[reversedIndex]['receptor_id']
                                    .toString() ==
                                widget.userId)) {
                      var date = DateTime.parse(snapshot
                          .data!.docs[reversedIndex]['created_at']
                          .toDate()
                          .toString());
                      String msgHour =
                          DateFormat('MM-dd-yy | kk:mm').format(date);

                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.35,
                            minWidth: MediaQuery.of(context).size.width / 5,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 3,
                              bottom: 4,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: isMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[reversedIndex]['content'],
                                ),
                                Text(
                                  msgHour,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
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
                    } else {
                      return Center();
                    }
                  },
                );
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
                        _message = newMessage;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
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
                      if (_formKey.currentState?.validate() == true &&
                          _message != '') {
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

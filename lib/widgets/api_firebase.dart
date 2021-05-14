import 'package:cloud_firestore/cloud_firestore.dart';
import './utils.dart';
import 'dart:convert';

class FirebaseApi {
  static Stream getMessages() => FirebaseFirestore.instance.collection('messages').orderBy('created_at').snapshots();

  static Future uploadMessage(String idUser, String receptorId, String msgContent) async{
    final refMessages = FirebaseFirestore.instance.collection('messages');
    final newMessage = {
      'content': msgContent,
      'receptor_id': receptorId,
      'transmitter_id': idUser,
      'created_at': DateTime.now(),
    };
    await refMessages.add(newMessage); 
  }
}
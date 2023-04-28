import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String text) async {
    try {
      await _firestore.collection('messages').add({
        'text': text,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Failed to send message: $e');
    }
  }

  Future<void> editMessage(String messageId, String newText) async {
    try {
      await _firestore.collection('messages').doc(messageId).update({
        'text': newText,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Failed to edit message: $e');
    }
  }

  Future<void> deleteMessage(String messageId) async {
    try {
      await _firestore.collection('messages').doc(messageId).delete();
    } catch (e) {
      print('Failed to delete message: $e');
    }
  }

  Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_chat.dart';
import 'chat.dart';

class MyChatPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Mate',
      home: ChatScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 80, 165, 94),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final auth _auth = auth();
  final Chat _chat = Chat();
  final TextEditingController _messageController = TextEditingController();
  Stream<QuerySnapshot>? _messageStream;

  @override
  void initState() {
    super.initState();
    _messageStream = _chat.getMessages();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}/${now.month}/${now.year}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Anonymous Chat'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green, // Set background color to green
            padding: EdgeInsets.all(8.0),
            child: Text(
              formattedDate, // Set current date
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messageStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('You are signed in anonymously'),
                  );
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message =
                        messages[index].data() as Map<String, dynamic>;
                    final isMe =
                        message['senderId'] == _auth.getCurrentUserId();
                    final bubbleAlignment =
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start;
                    final bubbleColor = isMe ? Colors.lightGreen : Colors.grey;
                    final bubbleTextStyle = isMe
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: bubbleAlignment,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: bubbleColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                message['text'],
                                style: bubbleTextStyle,
                              ),
                            ),
                            Text(
                              // final timestamp = (message['timestamp'] as Timestamp).toDate().toString();

                              message['timestamp'].toDate().toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String text = _messageController.text.trim();
                    if (text.isNotEmpty) {
                      _chat.sendMessage(text);
                      _messageController.clear();
                      setState(() {
                        _messageStream = _chat.getMessages();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

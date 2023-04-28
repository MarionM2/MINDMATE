import 'package:flutter/material.dart';

class MyChatPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Mate',
      home: ChatRoomPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 80, 165, 94),
        ),
      ),
    );
  }
}

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        _messages.add(
          Message(
            text: _textEditingController.text,
            isCurrentUser: true,
          ),
        );
        _textEditingController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anonymous Chat Room'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_messages[index].isCurrentUser) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        _messages[index].text,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        _messages[index].text,
                        style: TextStyle(color: Colors.green),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Divider(height: 1),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message',
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isCurrentUser;

  Message({required this.text, required this.isCurrentUser});
}

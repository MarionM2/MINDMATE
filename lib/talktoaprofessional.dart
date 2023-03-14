import 'package:flutter/material.dart';

class User {
  final String name;
  // final String imageUrl;
  User({required this.name});

  // User({required this.name, required this.imageUrl});
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<User> _users = [
    User(name: 'Peer counselor'),
    User(name: 'Psychologist'),
    User(name: 'Lifestyle coach'),
    User(name: 'Career coach'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk to a professional'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 9,
        children: _users
            .map((user) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(
                                user: user,
                              )),
                    );
                  },
                  child: SizedBox(
                    height: 2,
                    width: 2,
                    child: Card(
                      color: Color.fromARGB(255, 93, 150, 95),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image.network(
                          //   user.imageUrl,
                          //   fit: BoxFit.cover,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              user.name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final message = _textEditingController.text.trim();
                    if (message.isNotEmpty) {
                      setState(() {
                        _messages.add(message);
                        _textEditingController.clear();
                      });
                    }
                  },
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

void main() {
  runApp(MaterialApp(
    title: 'Chat App',
    theme: ThemeData(primarySwatch: Colors.green),
    home: ChatPage(),
  ));
}

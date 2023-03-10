import 'package:flutter/material.dart';
import 'chatroom.dart';
import 'home.dart';

class JoinChatPage extends StatelessWidget {
  const JoinChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Anonymous Chat Group'),
      ),
      body:
          // SizedBox(height: 20),
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to the anonymous chat group where users on the platform can share experience without showing their identity. Any Abuse on this space won't be allowed and user will be removed if they abuse anyone.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "Do you want to join the anonymous chat group?",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatRoomPage()),
                );
              },
              child: Text('Yes'),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}

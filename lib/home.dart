import 'package:flutter/material.dart';
import 'anonymouschat.dart';
import 'talktoaprofessional.dart';
import 'meditation1.dart';
import 'meditation2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: GridTile(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      // <-- Icon
                      Icons.book,
                      size: 20.0,
                    ),
                    label: Text('Open diary'), // <-- Text
                  ),
                ),

                // backgroundColor: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: GridTile(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                    icon: Icon(
                      // <-- Icon
                      Icons.person,
                      size: 20.0,
                    ),
                    label: Text('Meditation'), // <-- Text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: GridTile(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      // <-- Icon
                      Icons.backpack_rounded,
                      size: 20.0,
                    ),
                    label: Text('Resources'), // <-- Text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: GridTile(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JoinChatPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.chat,
                      size: 20,
                    ),
                    label: Text('Anonymous chat'),
                  ),
                  // backgroundColor: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: GridTile(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.chat_bubble,
                      size: 20,
                    ),
                    label: Text('Talk to a professional'),
                  ),
                  // backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              icon: Icon(Icons.mediation),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinChatPage(),
                    ));
              },
              icon: Icon(Icons.chat_bubble),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:helloworld/Diary_notes/view_last_diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/Diary_notes/new.dart';
import 'package:helloworld/components/homepage.dart';

class Diary extends StatelessWidget {
  Diary({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 250, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
        ],
        title: Text('MIND MATE'),
        backgroundColor: Color.fromRGBO(80, 165, 112, 100),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
          child: Container(
        height: 50.0, // Set the height of the drawer to be 200.0
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(80, 165, 112, 100),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 48.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'Hello User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
                title: GestureDetector(
              child: Text('New Diary Note'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DiaryScreen(),
                    ));
              },
            )),
            ListTile(
                title: GestureDetector(
              child: Text('View Last Diary Note'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DiaryListScreen(),
                    ));
              },
            )),
          ],
        ),
      )),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Center(
            child: Text('SCRIBBLE AWAY THOSE FEELINGS',
                style: TextStyle(
                    color: Color.fromRGBO(80, 165, 112, 100), fontSize: 30)),
          )),
    ));
  }
}

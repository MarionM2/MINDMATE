import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/Diary_notes/new.dart';
import 'package:helloworld/components/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworld/Diary_notes/d.dart';

class Diary extends StatelessWidget {
  Diary({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
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
                          'Hello ' + user.email!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      title: GestureDetector(
                    child: Text('New Diary Note',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        )),
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
                    child: Text('View Last Diary Note',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        )),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DiaryListScreens(),
                          ));
                    },
                  )),
                ],
              ),
            )),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  const SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 0, bottom: 0, right: 0, top: 100),
                      child:
                          Image.asset('assets/images/gif1.gif', height: 150)),
                  const SizedBox(height: 50),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 40, bottom: 20, right: 30, top: 10),
                      //apply padding to all four sides
                      child: Text('SCRIBBLE AWAY THOSE FEELINGS',
                          style: TextStyle(
                              color: Color.fromRGBO(80, 165, 112, 100),
                              fontSize: 40,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 100, bottom: 0, right: 100, top: 20),
                    //apply padding to all four sides
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Text(
                        'Click to start writing',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ])))));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Diary_notes/edit.dart';
import 'package:helloworld/Diary_notes/first_diary_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworld/Diary_notes/new.dart';

class DiaryListScreen extends StatefulWidget {
  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          String currentUserUid = '';
          if (snapshot.hasData) {
            currentUserUid = snapshot.data!.uid;
          }
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Diary()));
                  },
                ),
                title: Text('MINDMATE'),
                backgroundColor: Color.fromRGBO(80, 165, 112, 100),
                centerTitle: true,
              ),
              body: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('diary_entries')
                      .where('uid', isEqualTo: currentUserUid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      if (snapshot.data?.docs.isEmpty ?? true) {
                        return Center(
                          child: Text("No notes yet. Start writing!"),
                        );
                      }
                      return CircularProgressIndicator();
                    }
                    List<Widget> entries = [];
                    snapshot.data!.docs.forEach((doc) {
                      Map<String, dynamic>? data =
                          doc.data() as Map<String, dynamic>?;
                      if (data != null) {
                        String? entry = data['entry'] as String?;
                        String? fileName = data['fileName'] as String?;
                        DateTime? timestamp = data['timestamp']?.toDate();
                        String? title = data['title'] as String?;
                        if (entry != null &&
                            fileName != null &&
                            timestamp != null &&
                            title != null) {
                          entries.add(ListTile(
                            title: Text(title),
                            subtitle: Text(entry),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditDiaryScreen(
                                    title: title,
                                    entry: entry,
                                    fileName: fileName,
                                    timestamp: timestamp,
                                    docId: doc.id,
                                  ),
                                ),
                              );
                            },
                          ));
                        }
                      }
                    });
                    if (entries.isEmpty) {
                      return Center(
                          child: GestureDetector(
                              child: Text(
                                  'No notes yet. Click to start writing!',
                                  style: TextStyle(
                                      color: Color.fromRGBO(80, 165, 112, 100),
                                      fontSize: 20)),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DiaryScreen(),
                                    ));
                              }));
                    }
                    return ListView(
                      children: entries,
                    );
                  }));
        });
  }
}

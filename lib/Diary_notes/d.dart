import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworld/Diary_notes/first_diary_page.dart';
import 'package:flutter/material.dart';
import 'edit.dart';

class DiaryListScreens extends StatefulWidget {
  @override
  _DiaryListScreensState createState() => _DiaryListScreensState();
}

class _DiaryListScreensState extends State<DiaryListScreens> {
  final _firestore = FirebaseFirestore.instance;
  late final User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Diary()));
            },
          ),
          title: Text('MIND MATE'),
          backgroundColor: Color.fromRGBO(80, 165, 112, 100),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              const SizedBox(height: 5),
              Padding(
                  padding:
                      EdgeInsets.only(left: 0, bottom: 20, right: 0, top: 40),
                  child: Text('Diary Notes',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              const SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('diary_entries')
                    .where('userId', isEqualTo: _user.uid)
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    final diary_entries = snapshot.data!.docs;
                    return SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        child: ListView.builder(
                          itemCount: diary_entries.length,
                          itemBuilder: (context, index) {
                            final entry = diary_entries[index];
                            final title = entry['title'];
                            final date = entry['timestamp'].toDate();

                            return Card(
                              margin: EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(title,
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(80, 165, 112, 100),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(date.toString()),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DiaryEntryScreen(entry: entry),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ));
                  } else {
                    return Center(
                        child: Text('You have no diary entries yet.'));
                  }
                },
              )
            ]))));
  }
}

class DiaryEntryScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> entry;

  const DiaryEntryScreen({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = entry['title'];
    final content = entry['entry'];
    final date = entry['timestamp'].toDate();

    return Scaffold(
      appBar: AppBar(
        title: Text('MINDMATE'),
        backgroundColor: Color.fromRGBO(80, 165, 112, 100),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to the edit diary entry screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditDiaryEntryScreen(entry: entry),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              // Show confirmation dialog before deleting the entry
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete Entry'),
                  content: Text('Are you sure you want to delete this entry?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );

              // If the user confirms, delete the entry
              if (confirmed == true) {
                await entry.reference.delete();
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, bottom: 20, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text(date.toString()),
            SizedBox(height: 40.0),
            Text("Your Note",
                style: TextStyle(
                  color: Color.fromRGBO(80, 165, 112, 100),
                )),
            SizedBox(height: 40.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

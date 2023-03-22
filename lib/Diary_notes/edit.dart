import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Diary_notes/view_last_diary.dart';
import 'package:helloworld/Diary_notes/first_diary_page.dart';
import 'package:flutter/material.dart';

class EditDiaryScreen extends StatefulWidget {
  final String title;
  final String entry;
  final String fileName;
  final DateTime timestamp;
  final String docId;

  EditDiaryScreen({
    required this.title,
    required this.entry,
    required this.fileName,
    required this.timestamp,
    required this.docId,
  });

  @override
  _EditDiaryScreenState createState() => _EditDiaryScreenState();
}

class _EditDiaryScreenState extends State<EditDiaryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _entryController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _entryController.text = widget.entry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => DiaryListScreen()));
            },
          ),
          title: Text('MINDMATE'),
          backgroundColor: Color.fromRGBO(80, 165, 112, 100),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await _firestore
                    .collection('diary_entries')
                    .doc(widget.docId)
                    .delete();
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                await _firestore
                    .collection('diary_entries')
                    .doc(widget.docId)
                    .update({
                  'title': _titleController.text,
                  'entry': _entryController.text,
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.only(
                left: 15,
                bottom: 20,
                right: 20,
                top: 30), //apply padding to some sides only
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                      child: TextFormField(
                    controller: _entryController,
                    maxLines: null,
                  ))
                ])));
  }
}

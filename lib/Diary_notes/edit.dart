import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Diary_notes/first_diary_page.dart';
import 'package:flutter/material.dart';

class EditDiaryEntryScreen extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> entry;

  const EditDiaryEntryScreen({Key? key, required this.entry}) : super(key: key);

  @override
  _EditDiaryEntryScreenState createState() => _EditDiaryEntryScreenState();
}

class _EditDiaryEntryScreenState extends State<EditDiaryEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.entry['title'];
    _contentController.text = widget.entry['entry'];
  }

  void _updateEntry() async {
    if (_formKey.currentState!.validate()) {
      final entryId = widget.entry.id;
      await _firestore.collection('diary_entries').doc(entryId).update({
        'title': _titleController.text,
        'entry': _contentController.text,
        'timestamp': DateTime.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Entry updated')),
      );
      Navigator.pop(context);
    }
  }

  void _deleteEntry() async {
    final entryId = widget.entry.id;
    await _firestore.collection('diary_entries').doc(entryId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Entry deleted')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MINDMATE'),
          backgroundColor: Color.fromRGBO(80, 165, 112, 100),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _contentController,
                    decoration: InputDecoration(hintText: 'Content'),
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some content';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _deleteEntry,
                        child: Text('Delete'),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: _updateEntry,
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

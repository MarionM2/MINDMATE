import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Diary_notes/first_diary_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _entryController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  String _userId = '';

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userId = user.uid;
    }
  }

  void _saveEntry(String fileName) async {
    if (_formKey.currentState!.validate()) {
      if (_userId.isNotEmpty) {
        await _firestore.collection('diary_entries').add({
          'title': _titleController.text,
          'entry': _entryController.text,
          'fileName': fileName,
          'timestamp': DateTime.now(),
          'userId': _userId,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Entry saved')),
        );
        _titleController.clear();
        _entryController.clear();
      }
    }
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              SizedBox(height: 30.0),
              Expanded(
                child: TextFormField(
                  controller: _entryController,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 150, horizontal: 20),
                    hintText: 'Enter your note here',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a note';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final fileName = await showDialog(
                      context: context,
                      builder: (context) => _SaveFileDialog(),
                    );
                    if (fileName != null && fileName.isNotEmpty) {
                      _saveEntry(fileName);
                    }
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveFileDialog extends StatefulWidget {
  @override
  __SaveFileDialogState createState() => __SaveFileDialogState();
}

class __SaveFileDialogState extends State<_SaveFileDialog> {
  final _fileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Save Entry'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _fileNameController,
              decoration: InputDecoration(
                labelText: 'File Name',
                hintText: 'Enter a file name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a file name';
                }
                return null;
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_fileNameController.text.isNotEmpty) {
                  Navigator.of(context).pop(_fileNameController.text);
                }
              })
        ]);
  }
}

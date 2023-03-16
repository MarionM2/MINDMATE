import 'package:flutter/material.dart';
import 'home.dart';

class SummaryPage extends StatelessWidget {
  final String activity;
  final String note;

  SummaryPage({required this.activity, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity report'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 90.0, right: 5.0, left: 5.0),
        child: Center(
          child: Column(
            // padding:EdgeInsets.all(1),
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have been focusing:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.local_activity_rounded,
                    color: Color(0xff86c686)),
              ),
              SizedBox(height: 8.0),
              Text(
                activity,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 15.0),
              Center(
                child: Text(
                  'Your notes:',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Trajan Pro',
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  note,
                  maxLines: 7, // Maximum number of lines
                  overflow: TextOverflow
                      .ellipsis, // What to do if text exceeds maximum lines

                  style: TextStyle(fontSize: 15.0, fontFamily: "Schyler"),
                ),
              ),
              SizedBox(height: 150.0),
              Text(
                "Let's Explore more your feeling",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff548455),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myHomePage(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
                label: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

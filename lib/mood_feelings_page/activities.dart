import 'package:flutter/material.dart';
import 'summarypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Mate',
      home: ActivityPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(0xff, 0x50, 0xA5, 0x70),
        ),
      ),
    );
  }
}

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String _selectedActivity = "";
  TextEditingController _noteController = TextEditingController();

  Map<String, bool> _activityStatus = {
    'Family': false,
    'Relaxing': false,
    'Gaming': false,
    'Movies': false,
    'Date': false,
    'Reading': false,
    'Exercise': false,
    'Eat Healthy': false,
    'Shopping': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('What have you been up to?'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 13.0, right: 2, left: 2),
          child: SizedBox(
            // height: 16,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              ),
              itemCount: _activityStatus.length,
              itemBuilder: (context, index) {
                final activity = _activityStatus.keys.toList()[index];
                return GridTile(
                  child: _buildActivityButton(activity),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          // height: 200,
          child: Expanded(
            child: BottomAppBar(
              child: Padding(
                // padding: EdgeInsets.all(5.0),
                padding: const EdgeInsets.fromLTRB(
                    10.0, 10.0, 10.0, 150.0), // <-- add padding here
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _noteController,
                      decoration: InputDecoration(
                        hintText: 'Add notes',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      child: Text('Save'),
                      onPressed: () {
                        _saveNote();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildActivityButton(String activity) {
    final isSelected = _activityStatus[activity] ?? false;
    final color = isSelected ? Colors.green : null;

    IconData icon;
    switch (activity) {
      case 'Family':
        icon = Icons.family_restroom;
        break;
      case 'Relaxing':
        icon = Icons.spa;
        break;
      case 'Gaming':
        icon = Icons.gamepad;
        break;
      case 'Movies':
        icon = Icons.movie;
        break;
      case 'Date':
        icon = Icons.favorite;
        break;
      case 'Reading':
        icon = Icons.book;
        break;
      case 'Exercise':
        icon = Icons.fitness_center;
        break;
      case 'Eat Healthy':
        icon = Icons.restaurant;
        break;
      case 'Shopping':
        icon = Icons.shopping_bag;
        break;
      default:
        icon = Icons.error_outline;
    }

    return ElevatedButton.icon(
      label: Text(activity),
      icon: Icon(icon),
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      onPressed: () {
        _updateActivityStatus(activity);
      },
    );
  }

  void _updateActivityStatus(String activity) {
    setState(() {
      if (_selectedActivity == activity) {
        // Deselect the activity if it was already selected
        _activityStatus[_selectedActivity] = false;
        _selectedActivity = '';
      } else {
        // Clear the selection of the previous activity
        if (_selectedActivity.isNotEmpty) {
          _activityStatus[_selectedActivity] = false;
        }
        // Select the new activity
        _selectedActivity = activity;
        _activityStatus[_selectedActivity] = true;
      }
    });
  }

  void _saveNote() {
    String note = _noteController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SummaryPage(activity: _selectedActivity, note: note),
      ),
    );
  }
}

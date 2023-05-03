import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:helloworld/mood_feelings_page/activities.dart';
import 'package:flutter/material.dart';
import '../mood_feelings_page/mood.dart';
// import 'package:hellowoactivities.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final user = FirebaseAuth.instance.currentUser!;

//   // sign user out method
//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[900],
//         actions: [
//           IconButton(
//             onPressed: signUserOut,
//             icon: Icon(Icons.logout),
//           )
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mind Mate',
      home: MyHome(
        title: 'Mind Mate',
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff50a570),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 106),
              const Text(
                'How do you feel?',
                style: TextStyle(
                  color: Color.fromRGBO(177, 151, 129, 1),
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 60),
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select date'),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: const EdgeInsets.all(3.1),
                child: GestureDetector(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 179, 176, 37),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 0),
                        ),
                        child: const Center(
                          child: Text(
                            'Good',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(3.1),
                child: GestureDetector(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 158, 116, 25),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 0),
                        ),
                        child: const Center(
                          child: Text(
                            'Okay',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(3.1),
                child: GestureDetector(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(219, 56, 56, 1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 0),
                        ),
                        child: const Center(
                          child: Text(
                            'Bad',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ))),
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => MyApp()));
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("assets/images/save.png"),
                          size: 30,
                        ), // <-- Icon
                      ])),
            ]),
      ),
    );
  }
}

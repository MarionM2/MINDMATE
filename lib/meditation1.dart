import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'meditation2.dart';
import 'anonymouschat.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Avenir'),
      home: MyHomePage(),
      routes: {
        '/meditation2': (context) => ProductPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 150, 182, 119),
                child: Container(
                  margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/path.png'),
                          fit: BoxFit.contain)),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hello there! Welcome to MindMate",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: <Widget>[
                    categoryWidget('img1', "Resources"),
                    categoryWidget('img2', "Meditation"),
                    //categoryWidget('img3', "Meditation"),
                    //categoryWidget('img4', "Yoga"),
                  ],
                ),
              ),

              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   color: Colors.white,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: <Widget>[
              //       Column(
              //         children: <Widget>[
              //           FaIcon(FontAwesomeIcons.calendar),
              //           Text('Today')
              //         ],
              //       ),
              //       Column(
              //         children: <Widget>[
              //           FaIcon(
              //             FontAwesomeIcons.dumbbell,
              //             color: Color.fromARGB(255, 25, 92, 28),
              //           ),
              //           Text(
              //             'Calm',
              //             style: TextStyle(
              //                 color: Colors.green,
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: 20),
              //           )
              //         ],
              //       ),
              //       Column(
              //         children: <Widget>[
              //           Icon(Icons.settings),
              //           Text('Settings')
              //         ],
              //       ),
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              icon: Icon(Icons.mediation),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinChatPage(),
                    ));
              },
              icon: Icon(Icons.chat_bubble),
            ),
          ],
        ),
      ),
    );
  }

  Container categoryWidget(String img, String title) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
              offset: Offset(0, 10),
            )
          ]),
      child: InkWell(
        onTap: () {
          openmeditation2('$img', '$title');
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/$img.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void openmeditation2(String img, String title) {
    Navigator.pushNamed(context, '/meditation2',
        arguments: {'image': '$img', 'title': '$title'});
  }
}

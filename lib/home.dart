// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Mate',
      home: MyHomePage(title: 'Mind Mate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromARGB(255, 45, 134, 10),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // SizedBox(height: 10),
                Text("What have you been up to?",
                    style: TextStyle(
                        color: Color.fromRGBO(177, 151, 129, 1), fontSize: 15)),
                Container(
                  height: 430.0,
                  width: 500.0,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.count(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0.5),
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        children: [
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        Icon(Icons.family_restroom), // <-- Icon
                                        Text("Family")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage("assets/images/relax.png"),
                                          size: 24,
                                        ), // <-- Icon
                                        Text("Relax")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage("assets/images/Game.png"),
                                          size: 24,
                                        ), // <-- Icon
                                        Text("Gaming")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/cinema.png"),
                                          size: 24,
                                        ), // <-- Icon
                                        Text("Movies")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage("assets/images/date.png"),
                                        ), // <-- Icon
                                        Text("Date")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/reading.png"),
                                          size: 24,
                                        ), // <-- Icon
                                        Text("reading")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/exercise.png"),
                                          // color: Colors.red,
                                          size: 24,
                                        ), // <-- Icon
                                        Text("exercise")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  // splashColor: Colors.green,
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/eathealthy.png"),
                                          size: 24,
                                        ), // <-- Icon
                                        Text("eat healthy")
                                      ]))),
                          GridTile(
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/shopping.png"),
                                          size: 24,
                                        ), // <-- Icon
                                        Text("shopping")
                                      ]))),
                        ]);
                  }),
                ),
                Container(
                  height: 60.0,
                  width: 500.0,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(1.0),
                      crossAxisCount: 1,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        GridTile(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60.0),
                                child: TextField(
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 14, 15, 15))),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(10, 10, 10, 0.612),
                                        ),
                                      ),
                                      fillColor:
                                          Color.fromRGBO(217, 226, 235, 1),
                                      labelText: 'Add notes',
                                      filled: true),
                                ))),
                      ],
                    );
                  }),
                ),
                // SizedBox(height: 5),
                Container(
                  height: 40.0,
                  width: 70.0,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(1.0),
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        GridTile(
                            child: InkWell(
                                // splashColor: Colors.green,
                                onTap: () {},
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <Widget>[
                                      ImageIcon(
                                        AssetImage("assets/images/ssave.png"),
                                        size: 30,
                                      ), // <-- Icon
                                    ]))),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}

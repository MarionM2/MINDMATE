import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    String selectedImg;
    String selectTitle;
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    selectedImg = arguments['image'];
    selectTitle = arguments['title'];
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios,
          color: Color.fromARGB(255, 218, 212, 212),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.43,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 114, 163, 117),
            child: Container(
              margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/path.png'),
                  fit: BoxFit.contain
                )
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 90,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(selectTitle, style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 233, 222, 222)
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width*0.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                const Text('A calm and happy self? We got you 🤩', style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 235, 228, 228)
                                ),),
                                const SizedBox(height: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.9,
                                  margin: const EdgeInsets.only(right: 20),
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(40)),

                                  ),
                                  
                                  child: Row(
                                    children: const <Widget>[
                                      SizedBox(height: 10,),
                                      Icon(Icons.search, size: 30,),
                                      SizedBox(width: 20,),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                            )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(70),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/$selectedImg.png'),
                                  fit: BoxFit.contain
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[  
                                sessionWidget('Session 1', true),
                                sessionWidget('Session 2', false),
                              ],
                            ),
                            //Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //children: <Widget>[
                               // sessionWidget('Session 3', false),
                               // sessionWidget('Session 4', false),
                              //],
                            //),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(selectTitle, style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            spreadRadius: 1
                          )]
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(50),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/$selectedImg.png')
                                )
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text('Basics 2', style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700
                                  ),),
                                  Text('Start and deepen your patience', style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),)
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.lock_outline,
                                size: 30,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        FaIcon(FontAwesomeIcons.calendar),
                        Text('Today')
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        FaIcon(FontAwesomeIcons.dumbbell, color: Color.fromARGB(255, 67, 114, 75),),
                        Text('All Exercise', style: TextStyle(
                            color: Color.fromARGB(255, 68, 107, 52),
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),)
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.settings),
                        Text('Settings')
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  Container sessionWidget(String title, bool activeOrNot)
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 15,
          spreadRadius: 1
        )]
      ),
      child: Row(
        children: <Widget>[
          Icon(
              (activeOrNot == true) ? Icons.play_circle_filled : Icons.play_circle_outline,
            color: Color.fromARGB(255, 37, 112, 56),
            size: 50,
          ),
          const SizedBox(width: 10,),
          Text(title, style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),)
        ],
      ),
    );
  }
}
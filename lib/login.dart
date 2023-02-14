import 'package:flutter/material.dart';
import '/components/my_button.dart';
import '/components/my_textfield.dart';
import './mood.dart';

//void main() {
  //runApp(MyApp());
//}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // text controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Login Ui',
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
      backgroundColor: Color.fromRGBO(248, 248, 250, 1),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(80, 165, 112, 100),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Image.asset('assets/images/logo.jpeg', height: 150),

            const SizedBox(height: 50),
            const Text(
              'Welcome back!',
              style: TextStyle(
                color: Color.fromRGBO(177, 151, 129, 1),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: Color.fromRGBO(177, 151, 129, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    
            // username textfield
            const MyTextField(
              controller: null,
              obscureText: false,
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Color.fromRGBO(177, 151, 129, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            // password textfield
            const MyTextField(
              controller: null,
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromRGBO(177, 151, 129, 1)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // sign- in button
            const MyButton(),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Expanded(
                      child: Divider(
                    indent: 20.0,
                    thickness: 0.5,
                    color: Colors.grey,
                  )),

                  // not a member register now

                  const Text('Not a member?',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 1,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

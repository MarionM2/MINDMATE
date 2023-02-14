import 'package:flutter/material.dart';
import '/mood.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => MyHome(title: 'Mind Mate',)));
      },
        child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text(
                'Sign-In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )));
  }
}

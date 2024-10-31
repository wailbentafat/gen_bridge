// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  const Homepage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       backgroundColor: Color(0xFF4CAF50),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
              "GEN B",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF795548),
                letterSpacing: 5
              ),
             ),
             SizedBox(height: 20,),
             CircularProgressIndicator(
               valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF795548)),
             )
           ],
         )
      )
    );
  }
}
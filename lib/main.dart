import 'package:flutter/material.dart';
import 'package:unikom_student_card/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sajin",
      theme: ThemeData(
          primaryColor: Color(0xFF0E0A0A),
          accentColor: Color(0xFFFFFFFF),
          backgroundColor: Colors.white),
      home: HomeScreen(),
    );
  }
}


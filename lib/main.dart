import 'package:flutter/material.dart';
import 'package:untitled/screens/Todo.dart';
import 'screens/defaults/defaults.dart';
import '../screens/MainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// This can be in its own file
/*
  MainPage.dart
*/
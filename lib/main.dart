import 'package:flutter/material.dart';
import './pages/start.dart';
import './pages/end.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          body: SafeArea(
          child: Home(),
          ),
      ),
    );
  }
}


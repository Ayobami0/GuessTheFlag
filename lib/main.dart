import 'package:flutter/material.dart';
import 'package:guess_the_flag/widgets/quiz.dart';

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
          child: QuizData(),
          ),
      ),
    );
  }
}


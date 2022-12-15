import 'package:flutter/material.dart';
import 'package:guess_the_flag/pages/start.dart';
import 'package:guess_the_flag/widgets/quiz.dart';

class FinishPage extends StatelessWidget {

  final int userScore;
  final int totalScore;

  const FinishPage({super.key, required this.totalScore, required this.userScore});

  static const IconData refresh = IconData(0xe514, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 90), 
              Text('You scored $userScore/$totalScore'),
              const SizedBox(height: 90), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: ((context) => Home())));
                      }, 
                    icon: const Icon(Icons.home),
                    iconSize: 40,
                  ),
                  IconButton(
                      onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: ((context) => const QuizData())));
                        },
                    icon: const Icon(refresh),
                    iconSize: 40,
                  )
                ],
              ),
            ],
      )),
    );
  }
}

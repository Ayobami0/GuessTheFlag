import 'package:flutter/material.dart';
import '../widgets/quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Guess The Flag!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: IconButton(
                  onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: ((context) => const QuizData())));
                    },
                  icon: const Icon(Icons.play_circle, size: 90,)),
              )      
            ],),
        )
      )
    );
  }
}

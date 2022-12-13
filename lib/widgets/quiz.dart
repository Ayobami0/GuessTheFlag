import 'package:flutter/material.dart';
import '../countries.dart';
import '../random.dart';
import '../widgets/loading.dart';
import '../widgets/error.dart';
import '../pages/end.dart';

class QuizData extends StatefulWidget {
  const QuizData({super.key});

  @override
  State<QuizData> createState() => _QuizDataState();
}

class _QuizDataState extends State<QuizData> {
  int _quizCount = 1;
  int _scoreCount = 0;
  final int _quizNumber = 10;
  
  void _nextQuiz(flag, country){
      setState(() {
        if (_quizCount != _quizNumber) {
          _quizCount++;
          if (flag == country){
              print("correct");
              _scoreCount++;
          }else{
              print("wrong");
          }
        } else{
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const FinishPage())));
          _resetQuiz();
        }
      });
    }

  void _resetQuiz() {
      setState(() {
        _scoreCount = 0;
        _quizCount = 1;
      });
    }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (ctx, snapshot) {
      if (snapshot.hasData){
          List data = snapshot.data;
          String randomCountryFlag = getRandomCountry(data)['flags']['png'];
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      '$_quizCount of $_quizNumber',
                      style: const TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                  ),
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/Rolling.gif',
                    image: randomCountryFlag,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: snapshot.data.map<Widget>((country){
                          return Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => _nextQuiz(randomCountryFlag, country['flags']['png']),
                              child: Text(country['name']['common']),
                            ),
                          );
                        }
                      ).toList() 
                    ),
                  ), 
              ]),
            ),
          );
        } else if (snapshot.hasError) {
            return LoadingError(error: snapshot.error);
        } else {
          return Loading();
        }
    },
      future: getCountry(),
    );
  }
}

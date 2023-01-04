import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
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
  late int _quizCount;
  late int _scoreCount;
  final int _quizNumber = 2;
  late int _finalScore;
  late final Future myFuture;
  
  void _checkQuiz(flag, country){
    setState(() {
      _quizCount++;
    });
    print(_quizCount);
    if (_quizCount != _quizNumber) {
      if (flag == country){
          print("correct");
          _scoreCount++;
      }else{
          print("wrong");
      }
    } else{
      _resetQuiz();
    }
  }

  List getList(int n, List source) {
    return source.sample(n);
  }

  void _resetQuiz() {
      _finalScore = _scoreCount;
      Navigator.pop(context);
      print(_finalScore);
      print(_scoreCount);
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: ((context) => FinishPage(userScore: _finalScore, totalScore: _quizNumber,))));
    }
  
  @override
  void initState(){
    super.initState();

    myFuture = getCountry();
    _scoreCount = 0;
    _quizCount = 0;

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (ctx, snapshot) {
      if (snapshot.hasData){
          List data = getList(4, snapshot.data);
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/Rolling.gif',
                    image: randomCountryFlag,
                    height: 200,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: data.map<Widget>((country){
                          return Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _checkQuiz(randomCountryFlag, country['flags']['png']);
                              },
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
      future: myFuture,
    );
  }
}

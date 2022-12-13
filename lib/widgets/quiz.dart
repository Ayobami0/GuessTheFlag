import 'package:flutter/material.dart';
import '../countries.dart';
import '../random.dart';

class QuizData extends StatefulWidget {
  const QuizData({super.key});

  @override
  State<QuizData> createState() => _QuizDataState();
}

class _QuizDataState extends State<QuizData> {
  int _quizCount = 1;
  final int _quizNumber = 10;



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (ctx, snapshot) {
      List<Widget> children;
      if (snapshot.hasData){
          List data = snapshot.data;
          children = <Widget> [
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
              image: getRandomCountry(data)['flags']['png'],
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
                        onPressed: () => getCountry(),
                        child: Text(country['name']['common']),
                      ),
                    );
                  }
                ).toList() 
              ),
            ), 
          ];
        } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                ],),
              )
            ];
          }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
      );
    },
      future: getCountry(),
    );
  }
}

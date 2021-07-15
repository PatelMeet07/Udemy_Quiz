import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}
//void main() => runApp(MyApp()); both is same.. (=>) is called anonyomus function.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'what\'s your favorite color ?',
        'answers': ['Black', 'Red', 'White', 'Green'],
      },
      {
        'questionText': 'What\'s your favorite animal ?',
        'answers': ['Lion', 'Horse', 'Elephant', 'Cow'],
      },
      {
        'questionText': 'What\'s your favorite game ?',
        'answers': ['Ludo', 'Pubg', 'Cricket', 'Hockey'],
      }
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
            brightness: Brightness.light,
          ),
          body: Column(
            //  verticalDirection: VerticalDirection.down,
            children: [
              Question(
                questions[questionIndex]['questionText'] as String,
              ),
              ...(questions[questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}

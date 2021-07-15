import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}
//void main() => runApp(MyApp()); both is same.. (=>) is called anonyomus function.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  final _questions = const [
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
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < _questions.length) {
      print('We have more questions !');
    } else {
      print('No more questions !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
            //brightness: Brightness.light,
          ),
          body: questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: answerQuestion,
                  questionIndex: questionIndex,
                  questions: _questions,
                )
              : Result()),
    );
  }
}

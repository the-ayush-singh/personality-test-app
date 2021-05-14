import 'package:flutter/material.dart';
import 'package:test_app/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetApp() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 4},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Snake', 'score': 3},
        {'text': 'Lion', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your Food choices?',
      'answers': [
        {'text': 'Green Vegetable', 'score': 1},
        {'text': 'Eggs & Vegetable', 'score': 2},
        {'text': 'Non-Veg', 'score': 3},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Test'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQ: _answerQuestion,
                quesIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetApp),
      ),
    );
  }
}

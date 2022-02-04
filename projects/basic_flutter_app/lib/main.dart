//packages
import 'package:flutter/material.dart';

//files
//import './questions.dart';
//import './answer.dart';
import './quiz.dart';
import './results.dart';
//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp()); // => make function in one expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 6},
        {'text': 'Yellow', 'score': 4},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Snake', 'score': 4},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 10},
      ],
    },
    {
      'questionText': 'What is your favorite filipino food?',
      'answers': [
        {'text': 'Adobo', 'score': 10},
        {'text': 'Sinigang', 'score': 8},
        {'text': 'Letchon', 'score': 10},
        {'text': 'Nilaga', 'score': 6}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerButton(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print('Answer Chosen!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerButton: _answerButton,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Results(_totalScore, _resetQuiz),
      ), // Create basic design to app
    );
  }
}

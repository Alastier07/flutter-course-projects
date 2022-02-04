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
      'answers': ['Blue', 'Red', 'Green', 'Yellow'],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'What is your favorite filipino food?',
      'answers': ['Adobo', 'Sinigang', 'Letchon', 'Nilaga'],
    },
  ];

  var _questionIndex = 0;

  void _answerButton() {
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
            : Results(),
      ), // Create basic design to app
    );
  }
}

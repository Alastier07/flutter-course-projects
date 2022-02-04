//packages
import 'package:flutter/material.dart';

//files
import './questions.dart';
import './answer.dart';
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
  var _questionIndex = 0;

  void _answerButton() {
    setState(() {
      _questionIndex += 1;
    });
    print('Answer Chosen!');
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerButton, answer);
            }).toList() // ... spread operator move 1 list to another
          ],
        ),
      ), // Create basic design to app
    );
  }
}

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
    var questions = [
      'What is your favorite color?',
      'What is your favorite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex],
            ), //or questions.elementAt(0)
            Answer(_answerButton),
            Answer(_answerButton),
            Answer(_answerButton),
          ],
        ),
      ), // Create basic design to app
    );
  }
}

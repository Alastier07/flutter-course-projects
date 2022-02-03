import 'package:flutter/material.dart';

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
            Text(questions[_questionIndex]), //or questions.elementAt(0)
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerButton, //call the name function not the result
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print("Answer 2"), //anonymous function
            ),
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  // ...
                  print('Answer 3');
                } //anonymous function
                ),
          ],
        ),
      ), // Create basic design to app
    );
  }
}

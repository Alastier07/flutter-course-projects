import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp());
//}

void answerButton() {
  print('Answer Chosen!');
}

void main() => runApp(MyApp()); // => make function in one expression

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic App'),
        ),
        body: Column(
          children: [
            Text('The questions'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerButton, //call the name function not the result
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerButton,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerButton,
            ),
          ],
        ),
      ), // Create basic design to app
    );
  }
}

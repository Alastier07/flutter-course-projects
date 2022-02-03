import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp()); // => make function in one expression

class MyApp extends StatelessWidget {
  void answerButton() {
    print('Answer Chosen!');
  }

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

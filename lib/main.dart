import 'package:flutter/material.dart';

import './text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _message = const ["Good day!", "Welcome to the App!"];

  var _messageIndex = 0;

  void _nextMessages() {
    setState(() {
      if (_messageIndex < _message.length) {
        _messageIndex += 1;
        if (_messageIndex == _message.length) {
          _messageIndex = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: TextMessage(_message[_messageIndex], _nextMessages),
      ),
    );
  }
}

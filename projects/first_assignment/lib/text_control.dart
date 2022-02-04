import 'package:flutter/material.dart';

class NextMessage extends StatelessWidget {
  final VoidCallback messageHandler;

  NextMessage(this.messageHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Next'),
        onPressed: messageHandler,
        textColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}

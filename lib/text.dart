import 'package:flutter/material.dart';

import './text_control.dart';

class TextMessage extends StatelessWidget {
  final String messageText;
  final VoidCallback messageHandler;

  TextMessage(this.messageText, this.messageHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            messageText,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          NextMessage(
            messageHandler,
          )
        ],
      ),
    );
  }
}

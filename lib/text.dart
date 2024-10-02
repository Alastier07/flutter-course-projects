import 'package:flutter/material.dart';

import './text_control.dart';

class TextMessage extends StatelessWidget {
  final String messageText;
  final VoidCallback messageHandler;

  const TextMessage(this.messageText, this.messageHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            messageText,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
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

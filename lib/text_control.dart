import 'package:flutter/material.dart';

class NextMessage extends StatelessWidget {
  final VoidCallback messageHandler;

  const NextMessage(this.messageHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Next'),
        onPressed: messageHandler,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

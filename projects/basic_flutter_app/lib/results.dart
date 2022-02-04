import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultScore;

  Results(this.resultScore);

  String get resultPhrase {
    String resultText = 'Your Score: ${resultScore.toString()}';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}

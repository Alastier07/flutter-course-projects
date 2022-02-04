import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Results(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'Your Score: ${resultScore.toString()}';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

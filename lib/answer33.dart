import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectAnswer;
  final String answerText;
  Answer(this.selectAnswer, this.answerText);
  @override
  Widget build(BuildContext context) {

      return Container(
        width: 100.0,
        height: 30.0,
        margin: EdgeInsets.all(10.0),
        child:
        ElevatedButton(
          child:Text(answerText),

          onPressed: () => selectAnswer(),
        )
      );
    }
    }



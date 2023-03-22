import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectAnswer;
  final String answerText;
  const Answer(this.selectAnswer, this.answerText, {super.key});
  @override
  Widget build(BuildContext context) {

      return Container(
        width: 100.0,
        height: 30.0,
        margin: const EdgeInsets.all(10.0),
        child:
        ElevatedButton(
          child:Text(answerText),

          onPressed: () => selectAnswer(),
        )
      );
    }
    }



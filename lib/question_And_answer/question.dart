import 'package:flutter/material.dart';

class  Question extends StatelessWidget {
  final String questionText11;

  const Question(this.questionText11, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child:Text(questionText11,
      style:const TextStyle(
        fontSize: 20.0,
        color: Colors.green,
      ),
      textAlign: TextAlign.center,
    ),
    );
  }
}

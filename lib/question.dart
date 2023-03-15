import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText11;

  Question(this.questionText11);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child:Text(questionText11,
      style:TextStyle(
        fontSize: 20.0,
        color: Colors.green,
      ),
      textAlign: TextAlign.center,
    ),
    );
  }
}

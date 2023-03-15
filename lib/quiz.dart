import 'package:flutter/material.dart';
import './question.dart';
import './answer33.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>>questions;
  final int questionindex;
  final Function answerQuestion;

  Quiz({
   required this.questions,
   required this.questionindex,
   required this.answerQuestion,
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionindex]['questionText'] as String,
        ),
        ...(questions[questionindex]['answers'] as List<Map<String, Object>>).map((answer){
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}

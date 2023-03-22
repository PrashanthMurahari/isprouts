import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() =>runApp(const MaterialApp(
  home :MyApp()
));

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();

}
class MyAppState extends State<MyApp>{
  var _questionIndex =0;
  var totalScore= 0;
  void resetQuiz(){
    setState(() {
      _questionIndex=0;
      totalScore=0;
    });
  }
  void _answerQuestion(int score){
    totalScore+=score;
    setState(() {
      _questionIndex+= 1;
    });

  }
  var questions =[
    {
      'questionText':'Whats your name?',
      'answers':[
        {'text':'Prashanth','score':10},
        {'text':'Sreekanth','score':0},
        {'text':'Vamshi','score':0}
      ]
    },
    {
      'questionText':'Whats your age?',
      'answers':[
        {'text':'25','score':0},
        {'text':'23','score':0},
        {'text':'22','score':10},
        {'text':'20','score':0 }
      ]
    },
    {
      'questionText':'Whats your pet name?',
      'answers':[
        {'text':'Whisky','score':10},
        {'text':'Tesla','score':0}
      ]
    },

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        centerTitle: true,
      ),
      body:_questionIndex<questions.length ?
          Quiz(questions: questions, questionIndex: _questionIndex, answerQuestion:_answerQuestion)
          : Result(totalScore, resetQuiz),
    );
  }
}
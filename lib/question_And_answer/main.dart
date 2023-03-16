import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() =>runApp(MaterialApp(
  home :MyApp()
));

class MyApp extends StatefulWidget{
  @override
  MyAppstate createState() => MyAppstate();

}
class MyAppstate extends State<MyApp>{
  var _questionindex =0;
  var totalscore= 0;
  void resetQuiz(){
    setState(() {
      _questionindex=0;
      totalscore=0;
    });
  }
  void _answerquestion(int score){
    totalscore+=score;
    setState(() {
      _questionindex+= 1;
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
      'questionText':'Whats your pet name?',
      'answers':[
        {'text':'Whisky','score':10},
        {'text':'Tesla','score':0}
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
    }
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        centerTitle: true,
      ),
      body:_questionindex<questions.length ?
          Quiz(questions: questions, questionindex: _questionindex, answerQuestion:_answerquestion)
          : Result(totalscore, resetQuiz),
    );
  }
}
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetButton;
  Result(this.resultscore, this.resetButton);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Column(
        children: <Widget> [
        Text('Your Score is $resultscore',
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,

          ),
          ),
          SizedBox(height: 20.0,),
          TextButton(
            onPressed :() =>  resetButton(),

            child: Text('Restart',

            ),
            
          )
    ],
    ),
    );
  }
}

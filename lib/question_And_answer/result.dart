import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetButton;

  const Result(this.resultScore, this.resetButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Your Score is $resultScore',
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () => resetButton(),
            child: const Text(
              'Restart',
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main()=>runApp(const MaterialApp(
  home: Example(),
));

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

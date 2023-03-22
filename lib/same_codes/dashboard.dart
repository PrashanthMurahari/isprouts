import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
    home: Master()
));

class Master extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
    );
  }
}


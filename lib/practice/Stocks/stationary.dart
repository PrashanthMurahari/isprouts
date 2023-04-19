import 'package:flutter/material.dart';

class Stationary extends StatefulWidget {
  const Stationary({Key? key}) : super(key: key);

  @override
  State<Stationary> createState() => _StationaryState();
}

class _StationaryState extends State<Stationary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Stationary Items'),
        centerTitle: true,
      ),
    );
  }
}

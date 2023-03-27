import 'package:flutter/material.dart';

class Receptionists extends StatefulWidget {
  const Receptionists({Key? key}) : super(key: key);

  @override
  State<Receptionists> createState() => _ReceptionistsState();
}

class _ReceptionistsState extends State<Receptionists> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('reception'),
    );
  }
}

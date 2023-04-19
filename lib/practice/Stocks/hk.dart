import 'package:flutter/material.dart';

class HK extends StatefulWidget {
  const HK({Key? key}) : super(key: key);

  @override
  State<HK> createState() => _HKState();
}

class _HKState extends State<HK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('HK'),
        centerTitle: true,
      ),
    );
  }
}

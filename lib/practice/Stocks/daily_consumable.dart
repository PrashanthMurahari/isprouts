import 'package:flutter/material.dart';

class DailyConsumable extends StatefulWidget {
  const DailyConsumable({Key? key}) : super(key: key);

  @override
  State<DailyConsumable> createState() => _DailyConsumableState();
}

class _DailyConsumableState extends State<DailyConsumable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Daily Consumable'),
        centerTitle: true,
      ),
    );
  }
}

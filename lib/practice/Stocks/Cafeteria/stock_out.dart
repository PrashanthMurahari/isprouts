import 'package:flutter/material.dart';

class StockUsed extends StatefulWidget {
  const StockUsed({Key? key}) : super(key: key);

  @override
  State<StockUsed> createState() => _StockUsedState();
}

class _StockUsedState extends State<StockUsed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Stock Out'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [

        ],),
      ),
    );
  }
}

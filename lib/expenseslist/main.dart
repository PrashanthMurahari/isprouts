import 'package:flutter/material.dart';
import './sub_main_list.dart';
void main () => runApp(const MaterialApp(
  home:Homepage()
));
class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Reporting'),
        centerTitle: true,
      ),
      body:
        Column(
        children: <Widget> [
          const Card(
            child: Text('Chart'),),
        SubMainList()
    ],
    ),

    );
  }
}
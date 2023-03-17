import 'package:flutter/material.dart';
import './sub_main_list.dart';
void main () => runApp(MaterialApp(
  home:Homepage()
));
class Homepage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Reporting'),
        centerTitle: true,
      ),
      body:
        Column(
        children: <Widget> [
          Card(
            child: Text('Chart'),),
        SubMainList()
    ],
    ),

    );
  }
}
import 'package:flutter/material.dart';
import './user_input_list.dart';
import './transactions_display_list.dart';
import './transactions.dart';

class SubMainList extends StatefulWidget {
  @override
  State<SubMainList> createState() => _SubMainListState();
}
class _SubMainListState extends State<SubMainList> {
  final List<Transactions> transactions =[
    Transactions(
        id: 'Element1',
        title: 'Headphones' ,
        amount: 2990.0,
        date:DateTime.now()
    ),

  ];

  void _addnewtransaction(String txtitle, double txamount){
    final newTx=Transactions(
      title:txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      transactions.add(newTx);
    });
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
      UserInput(_addnewtransaction),
      TransactionList(transactions)
    ],
    );
  }
}

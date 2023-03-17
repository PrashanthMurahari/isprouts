import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> user_transactions;
  TransactionList(this.user_transactions);
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 300,
      child:ListView(
      children: user_transactions.map((tx){
        return Card(
          margin: EdgeInsets.all(10.0),
          child:
            Row(
              children: <Widget> [
                Container(
                  margin:EdgeInsets.fromLTRB(10.0, 0.0, 30.0, 20.0),
                  padding:EdgeInsets.all(5.0),
                  decoration:BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      )
                  ),
                  child:Text('Rs.${tx.amount}',
                    style:TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 20.0,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(tx.title,
                      style:TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20.0,

                        fontWeight: FontWeight.bold,

                      ) ,
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 12.0,
                      ),
                    ),

                  ],
                ),
              ],
            ),

        );
      }).toList(),
    ),
    );
  }
}

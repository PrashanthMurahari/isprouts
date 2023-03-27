import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final Function addTx;
  final titlecontroller =TextEditingController();
  final amountcontroller = TextEditingController();
  UserInput(this.addTx, {super.key});
  @override
  Widget build(BuildContext context) {

    return Card(
      child:
      Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        color: Colors.grey[200],
        child:
        Column(
          children: <Widget> [
            TextField(decoration: const InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
            ),
            TextField(decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
            ),
            TextButton(onPressed: (){
              addTx(titlecontroller.text,double.parse(amountcontroller.text));
            }, child: const Text('Add To List'))
          ],
        ),
      ),
    );
  }
}

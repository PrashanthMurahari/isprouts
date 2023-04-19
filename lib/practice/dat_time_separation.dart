import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main()=>runApp(const MaterialApp(
  home: Formatting(),
));
class Formatting extends StatefulWidget {
  const Formatting({Key? key}) : super(key: key);

  @override
  State<Formatting> createState() => _FormattingState();
}

class _FormattingState extends State<Formatting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hi'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child:Text(
            DateFormat('yyyy-MM-dd KK:mm').format(DateTime.now())
          ))
        ],
      ),
    );
  }
}



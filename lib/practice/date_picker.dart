import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: DatePicker(),));

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _date = DateTime.now();
  void _showPicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)).then((value) {
       setState(() {
         _date = value!;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(DateFormat('yyyy-MM-dd KK:mm').format(_date)),
          Center(child: ElevatedButton(onPressed: () {
            _showPicker();
          }, child: const Text('Choose'),),),
        ],
      ),
    );
  }
}

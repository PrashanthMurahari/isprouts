import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateTimePicker(),
    ));

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2000, 01, 01), end: DateTime(2023, 12, 30));

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DateTime',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('DateRange'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: pickDateRange,
                    child: Text(DateFormat('yyyy-MM-dd').format(start)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: pickDateRange,
                    child: Text(DateFormat('yyyy-MM-dd').format(end)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Duration: ${difference.inHours} hours'),
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1999),
        lastDate: DateTime(2025));
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}

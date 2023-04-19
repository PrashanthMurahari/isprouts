import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_dao.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_modal.dart';

class AddCafeteria extends StatefulWidget {
  const AddCafeteria({Key? key}) : super(key: key);

  @override
  State<AddCafeteria> createState() => _AddCafeteriaState();
}

class _AddCafeteriaState extends State<AddCafeteria> {
  final TextEditingController _stockName = TextEditingController();
  final TextEditingController _stockPresent = TextEditingController();
  final TextEditingController _stockUsed = TextEditingController();
  final TextEditingController _stockRemaining = TextEditingController();
  final TextEditingController _stockNeeded = TextEditingController();

  final CafeteriaDao _dao = CafeteriaDao();
  DateTime _date = DateTime.now();

  void _showPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _date = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Cafeteria Materials',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: _stockName,
                  decoration: InputDecoration(
                    hintText: 'Material Name',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _stockPresent,
                  decoration: InputDecoration(
                    hintText: 'Present Stock',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _stockUsed,
                  decoration: InputDecoration(
                    hintText: 'Stock Used',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _stockRemaining,
                  decoration: InputDecoration(
                    hintText: 'Remaining Stock',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _stockNeeded,
                  decoration: InputDecoration(
                    hintText: 'Stock Needed',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _showPicker();
                    },
                    child: Text(DateFormat('yyyy/MM/dd').format(_date))),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(5),
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(120, 40),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          _dao.addMaterial(CafeteriaModal(
                              stockName: _stockName.text,
                              stockPresent: _stockPresent.text,
                              stockUsed: _stockUsed.text,
                              stockRemaining: _stockRemaining.text,
                              stockNeeded: _stockNeeded.text,
                          dateTime: DateFormat('yyyy/MM/dd').format(_date)));
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Text('Save'),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(5),
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(120, 40),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Text('Cancel'),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

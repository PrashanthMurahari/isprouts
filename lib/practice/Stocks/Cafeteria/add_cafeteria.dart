import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_dao.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_modal.dart';

class AddCafeteria extends StatefulWidget {
  const AddCafeteria({Key? key}) : super(key: key);

  @override
  State<AddCafeteria> createState() => _AddCafeteriaState();
}

class _AddCafeteriaState extends State<AddCafeteria> {
  final TextEditingController _materialName = TextEditingController();
  final TextEditingController _presentStock = TextEditingController();
  final TextEditingController _stockUsed = TextEditingController();
  final TextEditingController _remainingStock = TextEditingController();
  final TextEditingController _stockNeeded = TextEditingController();

  final CafeteriaDao _dao = CafeteriaDao();

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
                  controller: _materialName,
                  decoration: InputDecoration(
                    hintText: 'Material Name',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _presentStock,
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
                  controller: _remainingStock,
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
                              stockName: _materialName.text,
                              stockPresent: _presentStock.text,
                              stockUsed: _stockUsed.text,
                              stockRemaining: _remainingStock.text,
                              stockNeeded: _stockNeeded.text));
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

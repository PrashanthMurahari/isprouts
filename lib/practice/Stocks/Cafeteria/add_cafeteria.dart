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
  final TextEditingController _stockIn = TextEditingController();
  final TextEditingController _stockOut = TextEditingController();
  final TextEditingController _closingStock = TextEditingController();
  final TextEditingController _reOrderRequired = TextEditingController();

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
                  controller: _stockName,
                  decoration: InputDecoration(
                    hintText: 'Stock Name',
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
                  controller: _stockIn,
                  decoration: InputDecoration(
                    hintText: 'Stock In',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _stockOut,
                  decoration: InputDecoration(
                    hintText: 'Stock Out',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                TextFormField(
                  controller: _closingStock,
                  decoration: InputDecoration(
                    hintText: 'Remaining Stock',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                TextFormField(
                  controller: _reOrderRequired,
                  decoration: InputDecoration(
                    hintText: 'ReOrder Required',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            stockIn: _stockIn.text,
                            stockOut: _stockOut.text,
                            closingStock: _closingStock.text,
                            reorderRequired: _reOrderRequired.text,
                          ));
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

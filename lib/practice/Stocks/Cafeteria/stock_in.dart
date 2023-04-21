import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_dao.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_modal.dart';

class StockIn extends StatefulWidget {
  const StockIn({Key? key}) : super(key: key);

  @override
  State<StockIn> createState() => _StockInState();
}

class _StockInState extends State<StockIn> {
  final TextEditingController _stockName = TextEditingController();
  final TextEditingController _reOrderRequired = TextEditingController();
  double _closingStock = 0;
  final CafeteriaDao _dao = CafeteriaDao();
  double _stockPresent = 0;
  double _stockIn = 0;
  double _stockOut = 0;

  void calculating() {
    setState(() {
      _closingStock = ((_stockPresent + _stockIn) - _stockOut);
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
                    hintText: 'Stock Name',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() => _stockPresent = 0);
                      } else {
                        setState(() => _stockPresent = double.parse(value));
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Present Stock',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() => _stockIn = 0);
                    } else {
                      setState(() => _stockIn = double.parse(value));
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Stock In',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() => _stockOut = 0);
                      } else {
                        setState(() => _stockOut = double.parse(value));
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Stock Out',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Visibility(
                  visible: false,
                  child: TextFormField(
                    controller: _reOrderRequired,
                    decoration: InputDecoration(
                      hintText: 'ReOrder Required',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
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
                          calculating();
                          Navigator.pop(context);
                          _dao.addMaterial(CafeteriaModal(
                            stockName: _stockName.text,
                            stockPresent: '$_stockPresent',
                            stockIn: '$_stockIn',
                            stockOut: '$_stockOut',
                            closingStock: '$_closingStock',
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

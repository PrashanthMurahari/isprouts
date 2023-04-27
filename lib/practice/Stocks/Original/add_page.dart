import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_dao.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_model.dart';

class AddStocks extends StatefulWidget {
  const AddStocks({Key? key}) : super(key: key);

  @override
  State<AddStocks> createState() => _AddStocksState();
}

class _AddStocksState extends State<AddStocks> {
  final TextEditingController _stockName = TextEditingController();
  final TextEditingController _stockId = TextEditingController();
  final TextEditingController _units = TextEditingController();

  // final TextEditingController _itemIn = TextEditingController();
  // final TextEditingController _itemOut = TextEditingController();
  //final TextEditingController _currentStock = TextEditingController();
  final TextEditingController _reOrder = TextEditingController();

  final StocksDao _stocksDao = StocksDao();

  double _itemIn = 0;
  double _itemOut = 0;
  double _currentStock = 0;

  void calculating() {
    if (_itemIn != null && _itemOut != null) {
      setState(() {
        _currentStock = _itemIn - _itemOut;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adding'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _stockId,
                    decoration: const InputDecoration(hintText: "ItemID"),
                  ),
                  TextField(
                    controller: _stockName,
                    decoration: const InputDecoration(hintText: "Item Name"),
                  ),
                  TextField(
                    controller: _units,
                    decoration: const InputDecoration(hintText: "Item Units"),
                  ),
                  Visibility(
                    visible: true,
                    child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            _itemIn = 0;
                          });
                        } else {
                          _itemIn = double.parse(value);
                        }
                      },
                      decoration: const InputDecoration(hintText: "Item In"),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            _itemOut = 0;
                          });
                        } else {
                          _itemOut = double.parse(value);
                        }
                      },
                      decoration: const InputDecoration(hintText: "Item Out"),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: TextField(
                      controller: _reOrder,
                      decoration:
                          const InputDecoration(hintText: "ReOrder level"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      calculating();
                      Navigator.pop(context);
                      _stocksDao.addStock(StocksModel(
                        stockId: _stockId.text,
                        stockName: _stockName.text,
                        units: _units.text,
                        itemIn: '$_itemIn',
                        itemOut: '$_itemOut',
                        currentStock: '$_currentStock',
                        reOrder: _reOrder.text,
                      ));
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
              ],
            )
          ],
        ));
  }
}

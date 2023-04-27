import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Sales/input_method.dart';
import 'package:isprouts/practice/Stocks/Total_stocks/total_stocks_dao.dart';
import 'package:isprouts/practice/Stocks/Total_stocks/total_stocks_model.dart';

import '../Original/stocks_dao.dart';

class AddTotalStocks extends StatefulWidget {
  String? itemId;

  AddTotalStocks(this.itemId, {Key? key}) : super(key: key);

  @override
  AddTotalStocksState createState() => AddTotalStocksState(itemId);
}

class AddTotalStocksState extends InputPage<AddTotalStocks> {
  final TextEditingController _itemId = TextEditingController();
  final TextEditingController _itemName = TextEditingController();

  //final TextEditingController _itemIn = TextEditingController();
  //final TextEditingController _itemOut = TextEditingController();
  //final TextEditingController _currentStock = TextEditingController();
  final TextEditingController _reOrder = TextEditingController();

  final StocksDao _stockDao = StocksDao();
  final TotalStockDao _totalStockDao = TotalStockDao();
  String? itemId;
  double _itemIn = 0;
  double _itemOut = 0;
  double _currentStock = 0;

  AddTotalStocksState(this.itemId);

  @override
  void initState() {
    _stockDao.getMaterial().first.then((value) => value.forEach((element) {
          _itemId.text = element.stockId;
          _itemName.text = element.stockName;
        }));
    if (_itemId != null) {
      _totalStockDao.getMaterialName(itemId!).then((value) {
        _itemIn = double.parse(value.itemIn);
        _itemOut = double.parse(value.itemOut);
      });
    }
    ;

    super.initState();
  }

  void calculating() {
    setState(() {
      _currentStock = _itemIn - _itemOut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _itemId,
                    enabled: false,
                    decoration: const InputDecoration(hintText: "Item ID"),
                    onChanged: (value) {},
                  ),

                  TextField(
                    controller: _itemName,
                    enabled: false,
                    decoration: const InputDecoration(hintText: "Item Name"),
                  ),

                  TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() => _itemIn = 0);
                      } else {
                        setState(() => _itemIn = double.parse(value));
                      }
                    },
                    decoration: const InputDecoration(hintText: "Item In"),
                  ),
                  TextField(
                    onChanged: (value1) {
                      if (value1.isEmpty) {
                        setState(() => _itemOut = 0);
                      } else {
                        setState(() => _itemOut = double.parse(value1));
                      }
                    },
                    decoration: const InputDecoration(hintText: "Item In"),
                  ),
                  // TextField(
                  //   controller: _currentStock,
                  //   decoration: const InputDecoration(hintText: "Current Stock"),
                  // ),
                  TextField(
                    controller: _reOrder,
                    decoration:
                        const InputDecoration(hintText: "Re-Order Level"),
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
                      _totalStockDao.addStock(TotalStocksModel(
                          itemId: _itemId.text,
                          itemName: _itemName.text,
                          itemIn: '$_itemIn',
                          itemOut: '$_itemOut',
                          currentStock: '$_currentStock',
                          reOrder: _reOrder.text));
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
        ),
      ),
    );
  }
}

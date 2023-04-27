import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_dao.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_model.dart';
import 'package:isprouts/practice/Stocks/Total_stocks/add_total_stocks_.dart';
import 'package:isprouts/practice/Stocks/Total_stocks/total_stocks_dao.dart';
import 'package:isprouts/practice/Stocks/Total_stocks/total_stocks_model.dart';
import 'package:isprouts/practice/Stocks/Original/add_page.dart';

import '../../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StocksMain(),
  ));
}

class StocksMain extends StatefulWidget {
  const StocksMain({Key? key}) : super(key: key);

  @override
  State<StocksMain> createState() => _StocksMainState();
}

class _StocksMainState extends State<StocksMain> {
  late Stream<List<StocksModel>> _stockStream;
  final StocksDao _stockDao = StocksDao();

  @override
  void initState() {
    _stockStream = _stockDao.getMaterial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Total Stocks'),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddStocks()));
                  },
                  child: const Text(
                    'New Item',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
              ],
            )
          ],
        ),
        body: StreamBuilder<List<StocksModel>>(
            stream: _stockStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final totalStockData = snapshot.data!;
              return SingleChildScrollView(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 20, 20),
                child: Column(children: [
                  Card(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('Item ID')),
                          DataColumn(label: Text('Item Name')),
                          DataColumn(label: Text('In')),
                          DataColumn(label: Text('Out')),
                          DataColumn(label: Text('Current Stock')),
                          DataColumn(label: Text('Re-order Level')),
                        ],
                        rows: totalStockData
                            .map((e) => DataRow(cells: [
                                  DataCell(IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  )),
                                  DataCell(Text(e.stockId)),
                                  DataCell(Text(e.stockName)),
                                  DataCell(Text(e.itemIn)),
                                  DataCell(Text(e.itemOut)),
                                  DataCell(Text(e.currentStock)),
                                  DataCell(Text(e.reOrder)),
                                ]))
                            .toList(),
                      ),
                    ),
                  ),
                ]),
              ));
            }));
  }
}

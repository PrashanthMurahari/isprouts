import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Original/add_page.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_dao.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_model.dart';

import '../../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StocksPage(),
  ));
}

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
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
          title: const Text('Stocks'),
          centerTitle: true,
        ),
        body: StreamBuilder<List<StocksModel>>(
            stream: _stockStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final stockData = snapshot.data!;
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 20, 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddStocks()));
                          },
                          child: const Text('New')),
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
                                DataColumn(label: Text('Item ID')),
                                DataColumn(label: Text('Item Name')),
                                DataColumn(label: Text('In')),
                              ],
                              rows: stockData
                                  .map((e) => DataRow(cells: [
                                        DataCell(Text(e.stockId)),
                                        DataCell(GestureDetector(
                                          onTap: () {

                                          },child: Text(e.stockName),
                                        )),
                                        DataCell(Text(e.units)),
                                      ]))
                                  .toList(),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

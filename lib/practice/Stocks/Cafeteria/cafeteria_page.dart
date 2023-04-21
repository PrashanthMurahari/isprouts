import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/add_cafeteria.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_dao.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_modal.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/re_order_2.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/stock_in.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/stock_out.dart';

class Cafeteria extends StatefulWidget {
  const Cafeteria({Key? key}) : super(key: key);

  @override
  State<Cafeteria> createState() => _CafeteriaState();
}

class _CafeteriaState extends State<Cafeteria> {
  late Stream<List<CafeteriaModal>> _cafeteriaStream;
  final CafeteriaDao _dao = CafeteriaDao();

  @override
  void initState() {
    super.initState();
    _cafeteriaStream = _dao.getMaterial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cafeteria materials',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            PopupMenuButton<int>(
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
                            builder: (context) => const AddCafeteria()));
                  },
                  child: const Text(
                    'New Material',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
                PopupMenuItem(
                    child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StockRequired()));
                  },
                  child: const Text(
                    'Re-Order Material',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
                PopupMenuItem(
                    child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StockIn()));
                  },
                  child: const Text(
                    'New Stock',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
                PopupMenuItem(
                    child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StockOut()));
                  },
                  child: const Text(
                    'Stock Used',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
              ],
            )
          ],
        ),
        body: StreamBuilder<List<CafeteriaModal>>(
            stream: _cafeteriaStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final cafeteriaData = snapshot.data!;
              return Center(
                child: Column(
                  children: [
                    Card(
                      margin:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('Material Name')),
                            DataColumn(label: Text('Present Stock')),
                            DataColumn(label: Text('In')),
                            DataColumn(label: Text('Out')),
                            DataColumn(label: Text('Closing Stock')),
                            DataColumn(label: Text('ReOrder Required')),
                          ],
                          rows: cafeteriaData
                              .map((e) => DataRow(cells: [
                                    DataCell(
                                      IconButton(
                                          onPressed: () {
                                          },
                                          icon: const Icon(Icons.edit)),
                                    ),
                                    DataCell(Text(e.stockName)),
                                    DataCell(Text(e.stockPresent)),
                                    DataCell(Text(e.stockIn)),
                                    DataCell(Text(e.stockOut)),
                                    DataCell(Text(e.closingStock)),
                                    DataCell(Text(e.reorderRequired)),
                                  ]))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  void buttons() {
    Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCafeteria()));
              },
              child: const Text('New Material')),
        ],
      ),
    );
  }
}

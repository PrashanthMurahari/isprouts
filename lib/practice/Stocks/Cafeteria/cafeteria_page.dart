import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/add_cafeteria.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_dao.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_modal.dart';

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
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddCafeteria()));
                        },
                        child: const Text('New Material')),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      margin:
                          const EdgeInsets.only(left: 30, top: 30, right: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(
                                label: Text('Material Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Present Stock',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Stock used',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Remaining Stock',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Stock Needed',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: cafeteriaData
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(
                                      e.stockName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataCell(Text(e.stockPresent)),
                                    DataCell(Text(e.stockUsed)),
                                    DataCell(Text(e.stockRemaining)),
                                    DataCell(Text(e.stockNeeded)),
                                    DataCell(Text(e.dateTime)),
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
}

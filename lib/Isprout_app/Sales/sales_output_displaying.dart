import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Sales/sales_crud_operations.dart';
import 'package:isprouts/Isprout_app/Sales/sales_model.dart';
import 'package:isprouts/Isprout_app/Sales/sales_page.dart';

class SalesMainPage extends StatefulWidget {
  const SalesMainPage({Key? key}) : super(key: key);

  @override
  State<SalesMainPage> createState() => _SalesMainPageState();
}

class _SalesMainPageState extends State<SalesMainPage> {
  late Stream<List<SalesModel>> _salesStream;
  final SalesDao _dao = SalesDao();

  @override
  void initState() {
    super.initState();
    _salesStream = _dao.getSales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leads Page',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<List<SalesModel>>(
        stream: _salesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final salesData = snapshot.data!;
          return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        showDialog(
                            context: context, builder: (_) => const SalesApp());
                      },
                      child: const Text(
                        'New Lead',
                      ),
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
                            DataColumn(label: Text('Lead ID')),
                            DataColumn(label: Text('Client Name')),
                            DataColumn(label: Text('Broker ID')),
                            DataColumn(label: Text('Centre ID')),
                            DataColumn(label: Text('Number of WS')),
                            DataColumn(label: Text('WS Size')),
                            DataColumn(label: Text('Number Of Manager Cabins')),
                            DataColumn(
                                label: Text('Number of Conference Rooms')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('State')),
                            DataColumn(label: Text('Remarks')),
                            DataColumn(label: Text('Reasons Of Loosing')),
                            DataColumn(label: Text('Sales Person')),
                          ],
                          rows: salesData
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.leadId)),
                                    DataCell(Text(e.clientName)),
                                    DataCell(Text(e.brokerId)),
                                    DataCell(Text(e.centreId)),
                                    DataCell(Text(e.numberOfWs)),
                                    DataCell(Text(e.wsSize)),
                                    DataCell(Text(e.noOfManageCabins)),
                                    DataCell(Text(e.numberOfConferenceRooms)),
                                    DataCell(Text(e.status)),
                                    DataCell(Text(e.state)),
                                    DataCell(Text(e.remarks)),
                                    DataCell(Text(e.reasonOfLoosing)),
                                    DataCell(Text(e.salesPerson)),
                                  ]))
                              .toList(),
                        ),
                      ),
                    )
                  ]));
        },
      ),
    );
  }
}

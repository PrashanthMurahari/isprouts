import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Broker_Firm/broker_firm_dao.dart';
import 'package:isprouts/Isprout_app/Broker_Firm/broker_firm_model.dart';
import 'package:isprouts/Isprout_app/Broker_Firm/broker_firm_page.dart';

import '../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: BrokerFirmOutput(),
  ));
}

class BrokerFirmOutput extends StatefulWidget {
  const BrokerFirmOutput({Key? key}) : super(key: key);

  @override
  State<BrokerFirmOutput> createState() => _BrokerFirmOutputState();
}

class _BrokerFirmOutputState extends State<BrokerFirmOutput> {
  late Stream<List<BrokerFirmModel>> _brokerFirmStream;
  final BrokerFirmDao _dao = BrokerFirmDao();

  @override
  void initState() {
    super.initState();
    _brokerFirmStream = _dao.getFirms();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Broker Firm Page',
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
      body: StreamBuilder<List<BrokerFirmModel>>(
        stream: _brokerFirmStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final brokerFirmData = snapshot.data!;
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
                            context: context, builder: (_) => const BrokerFirmPage());
                      },
                      child: const Text(
                        'New Broker Firm ',
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
                            DataColumn(label: Text('Broker Firm ID')),
                            DataColumn(label: Text('First Name')),
                            DataColumn(label: Text('Location')),
                            DataColumn(label: Text('Contact Name')),
                            DataColumn(label: Text('Contact Number')),
                          ],
                          rows: brokerFirmData
                              .map((e) => DataRow(cells: [
                            DataCell(Text(e.brokerFirmId)),
                            DataCell(Text(e.firstName)),
                            DataCell(Text(e.location)),
                            DataCell(Text(e.contactName)),
                            DataCell(Text(e.contactNumber)),
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


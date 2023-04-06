import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Broker_Firm/broker_firm_page.dart';
import 'package:isprouts/Isprout_app/Broker_fee/broker_fee_dao.dart';
import 'package:isprouts/Isprout_app/Broker_fee/broker_fee_model.dart';
import 'package:isprouts/Isprout_app/Broker_fee/broker_fee_page.dart';

import '../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: BrokerFeeOutput(),
  ));
}

class BrokerFeeOutput extends StatefulWidget {
  const BrokerFeeOutput({Key? key}) : super(key: key);

  @override
  State<BrokerFeeOutput> createState() => _BrokerFeeOutputState();
}

class _BrokerFeeOutputState extends State<BrokerFeeOutput> {

  late Stream<List<BrokerFeeModel>> _brokerFeeStream;
  final BrokerFeeDao _dao = BrokerFeeDao();
  @override
  void initState() {
    super.initState();
    _brokerFeeStream = _dao.getBrokerFee();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Broker Fee Page',
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
      body: StreamBuilder<List<BrokerFeeModel>>(
        stream: _brokerFeeStream,
        builder: (context,snapshot){
          if (!snapshot.hasData){
            return const CircularProgressIndicator();
          }
          final brokerFeeData =   snapshot.data!;
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
                            context: context, builder: (_) => const BrokerFeePage());
                      },
                      child: const Text(
                        'New Broker Fee',
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
                            DataColumn(label: Text('Broker ID')),
                            DataColumn(label: Text('Broker Fee')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Comments')),
                            DataColumn(label: Text('Brokerage Percent')),
                          ],
                          rows: brokerFeeData
                              .map((e) => DataRow(cells: [
                            DataCell(Text(e.leadId)),
                            DataCell(Text(e.brokerId)),
                            DataCell(Text(e.brokerFee)),
                            DataCell(Text(e.status)),
                            DataCell(Text(e.comments)),
                            DataCell(Text(e.brokeragePercent)),
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

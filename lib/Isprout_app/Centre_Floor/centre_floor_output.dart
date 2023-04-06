import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Centre_Floor/centre_floor_dao.dart';
import 'package:isprouts/Isprout_app/Centre_Floor/centre_floor_model.dart';
import 'package:isprouts/Isprout_app/Centre_Floor/centre_floor_page.dart';

import '../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: CentreFloorOutput(),
  ));
}

class CentreFloorOutput extends StatefulWidget {
  const CentreFloorOutput({Key? key}) : super(key: key);

  @override
  State<CentreFloorOutput> createState() => _CentreFloorOutputState();
}

class _CentreFloorOutputState extends State<CentreFloorOutput> {
  late Stream<List<CentreFloorManagement>> _centreFloorStream;
  final CentreFloorDao _dao = CentreFloorDao();

  @override
  void initState() {
    super.initState();
    _centreFloorStream = _dao.getCentreFloor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AHU Page',
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
      body: StreamBuilder<List<CentreFloorManagement>>(
        stream: _centreFloorStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final centreData = snapshot.data!;
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
                            context: context,
                            builder: (_) => const CentreFloorPage());
                      },
                      child: const Text(
                        'New Floor',
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
                            DataColumn(label: Text('Centre ID')),
                            DataColumn(label: Text('Floor Area')),
                            DataColumn(label: Text('Efficiency')),
                            DataColumn(label: Text('Floor No')),
                            DataColumn(label: Text('Number Of Car Parking')),
                            DataColumn(label: Text('Number Of Bike Parking')),
                          ],
                          rows: centreData
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.centreId)),
                                    DataCell(Text(e.floorArea)),
                                    DataCell(Text(e.efficiency)),
                                    DataCell(Text(e.floorNo)),
                                    DataCell(Text(e.numberOfCarParking)),
                                    DataCell(Text(e.numberOfBikeParking)),
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

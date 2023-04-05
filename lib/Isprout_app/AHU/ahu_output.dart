import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/AHU/ahu_dao.dart';
import 'package:isprouts/Isprout_app/AHU/ahu_model.dart';
import 'package:isprouts/Isprout_app/AHU/ahu_page.dart';
import '../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: AhuMainPage(),
  ));
}

class AhuMainPage extends StatefulWidget {
  const AhuMainPage({Key? key}) : super(key: key);

  @override
  State<AhuMainPage> createState() => _AhuMainPageState();
}

class _AhuMainPageState extends State<AhuMainPage> {
  late Stream<List<AhuManagement>> _ahuStream;
  final AhuDao _dao = AhuDao();

  @override
  void initState() {
    super.initState();
    _ahuStream = _dao.getAhu();
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
      body: StreamBuilder<List<AhuManagement>>(
        stream: _ahuStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final ahuData = snapshot.data!;
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
                            context: context, builder: (_) => const AhuPage());
                      },
                      child: const Text(
                        'New AHU',
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
                            DataColumn(label: Text('AHU ID')),
                            DataColumn(label: Text('Centre ID')),
                            DataColumn(label: Text('AHU Operational Days')),
                            DataColumn(label: Text('Start Date')),
                            DataColumn(label: Text('Start Time')),
                          ],
                          rows: ahuData
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.ahuId)),
                                    DataCell(Text(e.centreId)),
                                    DataCell(Text(e.ahuOperationalDays)),
                                    DataCell(Text(e.startDate)),
                                    DataCell(Text(e.startTime)),
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

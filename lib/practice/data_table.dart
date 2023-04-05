import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataIntoCard(),
    ));

class DataIntoCard extends StatefulWidget {
  const DataIntoCard({Key? key}) : super(key: key);

  @override
  State<DataIntoCard> createState() => _DataIntoCardState();
}

class _DataIntoCardState extends State<DataIntoCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Card',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
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
              onPressed: () {},
              child: const Text(
                'New Lead',
              ),
            ),
            Card(
                margin: const EdgeInsets.only(left: 30, top: 30, right: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                          label: Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'City',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'State',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Country',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('Prashanth')),
                        DataCell(Text('1234567890')),
                        DataCell(Text('KarimNagar')),
                        DataCell(Text('Telangana')),
                        DataCell(Text('India')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Prashanth')),
                        DataCell(Text('9573977890')),
                        DataCell(Text('KarimNagar')),
                        DataCell(Text('Telangana')),
                        DataCell(Text('India')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Prashanth')),
                        DataCell(Text('9573977890')),
                        DataCell(Text('KarimNagar')),
                        DataCell(Text('Telangana')),
                        DataCell(Text('India')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Prashanth')),
                        DataCell(Text('9573977890')),
                        DataCell(Text('KarimNagar')),
                        DataCell(Text('Telangana')),
                        DataCell(Text('India')),
                      ])
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

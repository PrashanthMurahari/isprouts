import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, home: DropDownWidget()));

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? valueChoose;
  final itemList = ['from', 'to', 'for', 'while'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('dropdown'),
        ),
        body: Center(
          child: Container(
            padding:const EdgeInsets.all(20),
            child: ExpansionTile(
              title: const Text('From'),
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: const Text('Vendor'),
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: const Text('WareHouse'),
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: const Text('Pantry1'),
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: const Text('WareHouse'),
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    title: const Text('WareHouse'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}

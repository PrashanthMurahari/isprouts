import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_dao.dart';

class ReOrder extends StatefulWidget {
  const ReOrder({Key? key}) : super(key: key);

  @override
  State<ReOrder> createState() => _ReOrderState();
}

class _ReOrderState extends State<ReOrder> {
  late List<String> _materials;
  final CafeteriaDao _cafeteriaDao = CafeteriaDao();

  @override
  void initState() {
    _cafeteriaDao.getMaterial().first.then((value) {
      _materials = [];
      for (var element in value) {
        _materials.add(element.stockName);
      }
    });
    //assigning();
    super.initState();
  }
  // late int lengthOfMaterial =_materials.length;
  // void assigning(){
  //   for (int i=0;i<lengthOfMaterial;i++){
  //     CheckBoxState(title: _materials[i]);
  //   }
  // }

  final materials = [
    CheckBoxState(title: 'select1'),
    CheckBoxState(title: 'select2'),
    CheckBoxState(title: 'select3'),
    CheckBoxState(title: 'select4'),
    CheckBoxState(title: 'select5'),
    CheckBoxState(title: 'select6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReOrdering Materials'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ...materials.map(buildSingleCheckBox).toList(),
          const SizedBox(height: 40,),
          ElevatedButton(
              onPressed: () {
                print(_materials);
              },
              child:const Text('print')),

        ],
      ),
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
      activeColor: Colors.green,
      value: checkbox.value,
      title: Text(checkbox.title),
      onChanged: (value) => setState(() => checkbox.value = value!));
}

class CheckBoxState {
  String title;
  bool value;

  CheckBoxState({required this.title, this.value = false});
}

import 'package:flutter/material.dart';

import 'cafeteria_dao.dart';

class StockIn extends StatefulWidget {
  const StockIn({Key? key}) : super(key: key);

  @override
  State<StockIn> createState() => _StockInState();
}

class _StockInState extends State<StockIn> {
  late List<String> _materials;
  final CafeteriaDao _cafeteriaDao = CafeteriaDao();

  @override
  void initState() {
    super.initState();

    _cafeteriaDao.getMaterial().first.then((value) {
      _materials = [];
      for (var element in value) {
        _materials.add(element.stockName);
      }
    });
    assigning();
  }

  late String element;
  late int lengthOfMaterials = _materials.length;

  void assigning() {
    for (int i = 0; i < lengthOfMaterials; i++) {
      setState(() {
        element = _materials[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock In'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

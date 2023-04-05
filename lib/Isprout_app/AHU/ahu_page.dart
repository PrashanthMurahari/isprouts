import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/AHU/ahu_dao.dart';
import 'package:isprouts/Isprout_app/AHU/ahu_model.dart';
import 'package:isprouts/Isprout_app/Sales/input_method.dart';

class AhuPage extends StatefulWidget {
  const AhuPage({Key? key}) : super(key: key);

  @override
  AhuPageState createState() => AhuPageState();
}

class AhuPageState extends InputPage<AhuPage> {
  final TextEditingController _ahuIdController = TextEditingController();
  final TextEditingController _centreIdController = TextEditingController();
  final TextEditingController _ahuOperationalDaysController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final AhuDao _dao = AhuDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'New Lead',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                textField(_ahuIdController, 'Enter AHU ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_centreIdController, 'Enter Centre ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_ahuOperationalDaysController,
                    'Enter AHU Operational Days'),
                const SizedBox(
                  height: 25,
                ),
                textField(_startDateController, 'Enter Start Date'),
                const SizedBox(
                  height: 25,
                ),
                textField(_startTimeController, 'Enter Start TIme'),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      _dao.addAhu(AhuManagement(
                        ahuId: _ahuIdController.text,
                        centreId: _centreIdController.text,
                        ahuOperationalDays: _ahuOperationalDaysController.text,
                        startDate: _startDateController.text,
                        startTime: _startTimeController.text,
                      ));
                    },
                    child: const Text('Add AHU'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

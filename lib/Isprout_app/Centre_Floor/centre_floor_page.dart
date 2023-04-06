import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Centre_Floor/centre_floor_model.dart';
import 'package:isprouts/Isprout_app/Sales/input_method.dart';

import 'centre_floor_dao.dart';


class CentreFloorPage extends StatefulWidget {
  const CentreFloorPage({Key? key}) : super(key: key);

  @override
  CentreFloorPageState createState() => CentreFloorPageState();
}

class CentreFloorPageState extends InputPage<CentreFloorPage> {
  final TextEditingController _centreIdController = TextEditingController();
  final TextEditingController _floorAreaController = TextEditingController();
  final TextEditingController _efficiencyController = TextEditingController();
  final TextEditingController _floorNoController = TextEditingController();
  final TextEditingController _numberOfCarParkingController =
      TextEditingController();
  final TextEditingController _numberOfBikeParkingController =
      TextEditingController();
  final CentreFloorDao _dao = CentreFloorDao();

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
          'New Floor',
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
                textField(_centreIdController, 'Enter Center ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_floorAreaController, 'Enter Floor Area'),
                const SizedBox(
                  height: 25,
                ),
                textField(_efficiencyController, 'Enter Efficiency'),
                const SizedBox(
                  height: 25,
                ),
                textField(_floorNoController, 'Enter Floor No'),
                const SizedBox(
                  height: 25,
                ),
                textField(_numberOfCarParkingController,
                    'Enter Number Of Car Parking'),
                const SizedBox(
                  height: 25,
                ),
                textField(_numberOfBikeParkingController,
                    'Enter Number Of Bike Parking'),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      _dao.addCentreFloor(CentreFloorManagement(
                        centreId: _centreIdController.text,
                        floorArea: _floorAreaController.text,
                        efficiency: _efficiencyController.text,
                        floorNo: _floorNoController.text,
                        numberOfCarParking: _numberOfCarParkingController.text,
                        numberOfBikeParking:
                            _numberOfBikeParkingController.text,
                      ));
                    },
                    child: const Text('Add Centre Floor'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

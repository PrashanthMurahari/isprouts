import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Sales/input_method.dart';
import 'package:isprouts/Isprout_app/Sales/sales_model.dart';
import 'package:isprouts/Isprout_app/Sales/sales_crud_operations.dart';
class SalesApp extends StatefulWidget {
  const SalesApp({Key? key}) : super(key: key);

  @override
  SalesAppState createState() => SalesAppState();
}

class SalesAppState extends InputPage<SalesApp> {
  final TextEditingController _leadIdController = TextEditingController();
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _brokerIdController = TextEditingController();
  final TextEditingController _centreIdController = TextEditingController();
  final TextEditingController _numberOfWsController = TextEditingController();
  final TextEditingController _wsSizeController = TextEditingController();
  final TextEditingController _noOfManageCabinsController =
      TextEditingController();
  final TextEditingController _numberOfConferenceRoomsController =
      TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _reasonOfLoosingController =
      TextEditingController();
  final TextEditingController _salesPersonController = TextEditingController();
  final SalesDao _dao = SalesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
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
                textField(_leadIdController, 'Enter Lead ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_clientNameController, 'Enter Client Name'),
                const SizedBox(
                  height: 25,
                ),
                textField(_brokerIdController, 'Enter Broker ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_centreIdController, 'Enter Centre ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_numberOfWsController, 'Enter Number Of WS'),
                const SizedBox(
                  height: 25,
                ),
                textField(_wsSizeController, 'Enter WS Size'),
                const SizedBox(
                  height: 25,
                ),
                textField(_noOfManageCabinsController,
                    'Enter Number of Manager Cabins'),
                const SizedBox(
                  height: 25,
                ),
                textField(_numberOfConferenceRoomsController,
                    'Enter Number of Conference rooms'),
                const SizedBox(
                  height: 25,
                ),
                textField(_statusController, 'Enter Status'),
                const SizedBox(
                  height: 25,
                ),
                textField(_stateController, 'Enter State'),
                const SizedBox(
                  height: 25,
                ),
                textField(_remarksController, 'Enter Remarks'),
                const SizedBox(
                  height: 25,
                ),
                textField(
                    _reasonOfLoosingController, 'Enter Reasons of Loosing'),
                const SizedBox(
                  height: 25,
                ),
                textField(_salesPersonController, 'Enter Sales Person'),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      _dao.addSales(SalesModel(
                          leadId: _leadIdController.text,
                          clientName: _clientNameController.text,
                          brokerId: _brokerIdController.text,
                          centreId: _centreIdController.text,
                          numberOfWs: _numberOfWsController.text,
                          wsSize: _wsSizeController.text,
                          noOfManageCabins: _noOfManageCabinsController.text,
                          numberOfConferenceRooms:
                              _numberOfConferenceRoomsController.text,
                          status: _statusController.text,
                          state: _stateController.text,
                          remarks: _remarksController.text,
                          reasonOfLoosing: _reasonOfLoosingController.text,
                          salesPerson: _salesPersonController.text));
                    },
                    child: const Text('Add New Sales'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

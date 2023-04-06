import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Broker_Firm/broker_firm_dao.dart';
import 'package:isprouts/Isprout_app/Sales/input_method.dart';

import 'broker_firm_model.dart';


class BrokerFirmPage extends StatefulWidget {
  const BrokerFirmPage({Key? key}) : super(key: key);

  @override
  BrokerFirmPageState createState() => BrokerFirmPageState();
}

class BrokerFirmPageState extends InputPage<BrokerFirmPage> {
  final TextEditingController _brokerFirmIdController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _locationController =
  TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final BrokerFirmDao _dao = BrokerFirmDao();

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
            'New Broker Firm',
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
                  textField(_brokerFirmIdController, 'Enter Broker Firm ID'),
                  const SizedBox(
                    height: 25,
                  ),
                  textField(_firstNameController, 'Enter First Name'),
                  const SizedBox(
                    height: 25,
                  ),
                  textField(_locationController,
                      'Enter Location'),
                  const SizedBox(
                    height: 25,
                  ),
                  textField(_contactNameController, 'Enter Contact Name'),
                  const SizedBox(
                    height: 25,
                  ),
                  textField(_contactNumberController, 'Enter Contact NUmber'),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _dao.addFirms(BrokerFirmModel(
                          brokerFirmId: _brokerFirmIdController.text,
                          firstName: _firstNameController.text,
                          location: _locationController.text,
                          contactName: _contactNameController.text,
                          contactNumber: _contactNumberController.text,
                        ));
                      },
                      child: const Text('Add Broker Firm'))
                ],
              ),
            ),
          ),
        ),
    );
  }
}

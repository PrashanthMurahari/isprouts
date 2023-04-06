import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Broker_fee/broker_fee_dao.dart';
import 'package:isprouts/Isprout_app/Broker_fee/broker_fee_model.dart';

import '../Sales/input_method.dart';

class BrokerFeePage extends StatefulWidget {
  const BrokerFeePage({Key? key}) : super(key: key);

  @override
  BrokerFeePageState createState() => BrokerFeePageState();
}

class BrokerFeePageState extends InputPage<BrokerFeePage> {
  final TextEditingController _leadIdController =TextEditingController();
  final TextEditingController _brokerIdController =TextEditingController();
  final TextEditingController _brokerFeeController =TextEditingController();
  final TextEditingController _statusController =TextEditingController();
  final TextEditingController _commentsController =TextEditingController();
  final TextEditingController _brokeragePercentController =TextEditingController();
  final BrokerFeeDao _dao = BrokerFeeDao();
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
          'New Broker Fee',
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
                textField(_brokerIdController, 'Enter Broker ID'),
                const SizedBox(
                  height: 25,
                ),
                textField(_brokerFeeController,
                    'Enter Broker Fee'),
                const SizedBox(
                  height: 25,
                ),
                textField(_statusController, 'Enter Status'),
                const SizedBox(
                  height: 25,
                ),
                textField(_commentsController, 'Enter Comments'),
                const SizedBox(
                  height: 25,
                ),
                textField(_brokeragePercentController, 'Enter Brokerage Percent'),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      _dao.addBrokerFee(BrokerFeeModel(
                        leadId: _leadIdController.text,
                        brokerId: _brokerIdController.text,
                        brokerFee: _brokerFeeController.text,
                        status: _statusController.text,
                        comments: _commentsController.text,
                        brokeragePercent: _brokeragePercentController.text,
                      ));
                    },
                    child: const Text('Add Broker Fee'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

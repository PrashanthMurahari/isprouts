import 'package:cloud_firestore/cloud_firestore.dart';

import 'broker_fee_model.dart';

class BrokerFeeDao {
  final CollectionReference _brokerFeeCollection =
      FirebaseFirestore.instance.collection("Broker Fee");

  Future<void> addBrokerFee(BrokerFeeModel fee) {
    return _brokerFeeCollection.doc(fee.leadId).set(fee.toJson());
  }

  Future<BrokerFeeModel> getBrokerId(String leadId) async {
    return BrokerFeeModel.fromSnapshot(
        await _brokerFeeCollection.doc(leadId).get());
  }

  Stream<List<BrokerFeeModel>> getBrokerFee() {
    return _brokerFeeCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => BrokerFeeModel.fromSnapshot(doc)).toList());
  }
}

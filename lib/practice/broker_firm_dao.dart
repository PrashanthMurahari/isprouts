import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isprouts/practice/broker_firm_model.dart';

class BrokerFirmDao {
  final CollectionReference _brokerFirmCollection =
      FirebaseFirestore.instance.collection('Broker Firm');

  Future<void> addFirms(BrokerFirmModel firms) {
    return _brokerFirmCollection.doc(firms.brokerFirmId).set(firms.toJson());
  }
  Future<BrokerFirmModel> getAhuId(String ahuId) async {
    return BrokerFirmModel.fromSnapshot(
        await _brokerFirmCollection.doc(ahuId).get());
  }

  Stream<List<BrokerFirmModel>> getFirms() {
    return _brokerFirmCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => BrokerFirmModel.fromSnapshot(doc)).toList());
  }
}

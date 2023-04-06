import 'package:cloud_firestore/cloud_firestore.dart';

class BrokerFeeModel {
  final String leadId;
  final String brokerId;
  final String brokerFee;
  final String status;
  final String comments;
  final String brokeragePercent;

  BrokerFeeModel(
      {required this.leadId,
      required this.brokerId,
      required this.brokerFee,
      required this.status,
      required this.comments,
      required this.brokeragePercent});

  factory BrokerFeeModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return BrokerFeeModel(
        leadId: snapshot['leadId'],
        brokerId: snapshot['brokerId'],
        brokerFee: snapshot['brokerFee'],
        status: snapshot['status'],
        comments: snapshot['comments'],
        brokeragePercent: snapshot['brokeragePercent']);
  }

  Map<String, dynamic> toJson() => {
        "leadId": leadId,
        "brokerId": brokerId,
        "brokerFee": brokerFee,
        "status": status,
        "comments": comments,
        "brokeragePercent": brokeragePercent
      };
}

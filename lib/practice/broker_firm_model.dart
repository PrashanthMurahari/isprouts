import 'package:cloud_firestore/cloud_firestore.dart';

class BrokerFirmModel {
  final String brokerFirmId;
  final String firstName;
  final String location;
  final String contactName;
  final String contactNumber;

  BrokerFirmModel({
    required this.brokerFirmId,
    required this.firstName,
    required this.location,
    required this.contactName,
    required this.contactNumber,
  });

  factory BrokerFirmModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return BrokerFirmModel(
        brokerFirmId: snapshot['brokerFirmId'],
        firstName: snapshot['firstName'],
        location: snapshot['location'],
        contactName: snapshot['contactName'],
        contactNumber: snapshot['contactNumber']);
  }

  Map<String, dynamic> toJson() => {
        "brokerFirmId": brokerFirmId,
        "firstName": firstName,
        "location": location,
        "contactName": contactName,
        "contactNumber": contactNumber
      };
}

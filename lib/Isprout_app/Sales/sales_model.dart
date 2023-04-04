import 'package:cloud_firestore/cloud_firestore.dart';

class SalesModel {
  final String leadId;
  final String clientName;
  final String brokerId;
  final String centreId;
  final String numberOfWs;
  final String wsSize;
  final String noOfManageCabins;
  final String numberOfConferenceRooms;
  final String status;
  final String state;
  final String remarks;
  final String reasonOfLoosing;
  final String salesPerson;

  SalesModel(
      {required this.leadId,
      required this.clientName,
      required this.brokerId,
      required this.centreId,
      required this.numberOfWs,
      required this.wsSize,
      required this.noOfManageCabins,
      required this.numberOfConferenceRooms,
      required this.status,
      required this.state,
      required this.remarks,
      required this.reasonOfLoosing,
      required this.salesPerson});

  factory SalesModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return SalesModel(
        leadId: snapshot["leadId"],
        clientName: snapshot["clientName"],
        brokerId: snapshot["brokerId"],
        centreId: snapshot["centreId"],
        numberOfWs: snapshot["numberOfWs"],
        wsSize: snapshot["wsSize"],
        noOfManageCabins: snapshot["noOfManageCabins"],
        numberOfConferenceRooms: snapshot["numberOfConferenceRooms"],
        status: snapshot["status"],
        state: snapshot["state"],
        remarks: snapshot["remarks"],
        reasonOfLoosing: snapshot["reasonOfLoosing"],
        salesPerson: snapshot["salesPerson"]);
  }

  Map<String, dynamic> toJson() => {
        "leadId": leadId,
        "clientName": clientName,
        "brokerId": brokerId,
        "centreId": centreId,
        "numberOfWs": numberOfWs,
        "wsSize": wsSize,
        "noOfManageCabins": noOfManageCabins,
        "numberOfConferenceRooms": numberOfConferenceRooms,
        "status": status,
        "state": state,
        "remarks": remarks,
        "reasonOfLoosing": reasonOfLoosing,
        "salesPerson": salesPerson,
      };
}

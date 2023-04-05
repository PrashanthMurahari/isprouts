import 'package:cloud_firestore/cloud_firestore.dart';


class AhuManagement {
  final String ahuId;
  final String centreId;
  final String ahuOperationalDays;

  AhuManagement({
    required this.ahuId,
    required this.centreId,
    required this.ahuOperationalDays,
  });

  factory AhuManagement.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return AhuManagement(
        ahuId: snapshot['ahuId'],
        centreId: snapshot['centreId'],
        ahuOperationalDays: snapshot['ahuOperationalDays']);
  }

  Map<String, dynamic>toJson()=>{
    "ahuId":ahuId,
    "centreId":centreId,
    "ahuOperationalDays":ahuOperationalDays,
  };
}

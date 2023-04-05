import 'package:cloud_firestore/cloud_firestore.dart';

class CentreFloorManagement {
  final String centreId;
  final String floorArea;
  final String efficiency;
  final String floorNo;
  final String numberOfCarParking;
  final String numberOfBikeParking;

  CentreFloorManagement({
    required this.centreId,
    required this.floorArea,
    required this.efficiency,
    required this.floorNo,
    required this.numberOfCarParking,
    required this.numberOfBikeParking,
  });

  factory CentreFloorManagement.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CentreFloorManagement(
        centreId: snapshot['centreId'],
        floorArea: snapshot['floorArea'],
        efficiency: snapshot['efficiency'],
        floorNo: snapshot['floorNo'],
        numberOfCarParking: snapshot['numberOfCarParking'],
        numberOfBikeParking: snapshot['numberOfBikeParking']);
  }

  Map<String, dynamic> toJson() => {
        "centreId": centreId,
        "floorArea": floorArea,
        "efficiency": efficiency,
        "floorNo": floorNo,
        "numberOfCarParking": numberOfCarParking,
        "numberOfBikeParking": numberOfBikeParking
      };
}

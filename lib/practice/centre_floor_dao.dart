import 'package:cloud_firestore/cloud_firestore.dart';
import 'centre_floor_model.dart';

class CentreFloorDao {
  final CollectionReference _centreFloorCollection =
      FirebaseFirestore.instance.collection('Centre Floor Management');

  Future<void> addCentreFloor(CentreFloorManagement floors) {
    return _centreFloorCollection.doc(floors.centreId).set(floors.toJson());
  }
  Future<CentreFloorManagement> getAhuId(String ahuId) async {
    return CentreFloorManagement.fromSnapshot(
        await _centreFloorCollection.doc(ahuId).get());
  }

  Stream<List<CentreFloorManagement>> getCentreFloor() {
    return _centreFloorCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => CentreFloorManagement.fromSnapshot(doc))
        .toList());
  }
}

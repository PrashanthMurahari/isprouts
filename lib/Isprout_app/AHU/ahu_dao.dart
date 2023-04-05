import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isprouts/Isprout_app/AHU/ahu_model.dart';

class AhuDao {
  final CollectionReference _ahuCollection =
      FirebaseFirestore.instance.collection("AHU Management");

  Future<void> addAhu(AhuManagement ahu) {
    return _ahuCollection.doc(ahu.ahuId).set(ahu.toJson());
  }

  Future<AhuManagement> getAhuId(String ahuId) async {
    return AhuManagement.fromSnapshot(
        await _ahuCollection.doc(ahuId).get());
  }

  Stream<List<AhuManagement>> getAhu() {
    return _ahuCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => AhuManagement.fromSnapshot(doc)).toList());
  }
}

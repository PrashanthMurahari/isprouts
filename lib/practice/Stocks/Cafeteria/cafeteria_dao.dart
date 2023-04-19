import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_modal.dart';

class CafeteriaDao{
  final CollectionReference _cafeteriaCollection =
  FirebaseFirestore.instance.collection("Cafeteria Materials");

  Future<void> addMaterial(CafeteriaModal material) {
    return _cafeteriaCollection.doc(material.stockName).set(material.toJson());
  }

  Future<CafeteriaModal> getMaterialName(String material) async {
    return CafeteriaModal.fromSnapshot(
        await _cafeteriaCollection.doc(material).get());
  }

  Stream<List<CafeteriaModal>> getMaterial() {
    return _cafeteriaCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CafeteriaModal.fromSnapshot(doc)).toList());
  }
}

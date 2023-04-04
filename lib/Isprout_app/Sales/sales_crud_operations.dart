import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isprouts/Isprout_app/Sales/sales_model.dart';

class SalesDao{
  final CollectionReference _salesCollection =
      FirebaseFirestore.instance.collection('Sales');

  Future<void> addSales(SalesModel sales) {
    return _salesCollection.doc(sales.leadId).set(sales.toJson());
  }

  Stream<List<SalesModel>> getSales() {
    return _salesCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => SalesModel.fromSnapshot(doc)).toList());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isprouts/practice/Stocks/Total_stocks/total_stocks_model.dart';

class TotalStockDao {
  final CollectionReference _totalStocksCollection =
  FirebaseFirestore.instance.collection("Total Stocks");

  Future<void> addStock(TotalStocksModel stock) {
    return _totalStocksCollection.doc(stock.itemId).set(stock.toJson());
  }
  Future<TotalStocksModel> getMaterialName(String itemId) async {
    return TotalStocksModel.fromSnapshot(
        await _totalStocksCollection.doc(itemId).get());
  }
  Stream<List<TotalStocksModel>> getMaterial() {
    return _totalStocksCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TotalStocksModel.fromSnapshot(doc)).toList());
  }
}
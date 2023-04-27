import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isprouts/practice/Stocks/Original/stocks_model.dart';

class StocksDao {
  final CollectionReference _stocksCollection =
  FirebaseFirestore.instance.collection("Stocks");

  Future<void> addStock(StocksModel stock) {
    return _stocksCollection.doc(stock.stockId).set(stock.toJson());
  }
  Future<StocksModel> getMaterialName(String stockId) async {
    return StocksModel.fromSnapshot(
        await _stocksCollection.doc(stockId).get());
  }
  Stream<List<StocksModel>> getMaterial() {
    return _stocksCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => StocksModel.fromSnapshot(doc)).toList());
  }
}
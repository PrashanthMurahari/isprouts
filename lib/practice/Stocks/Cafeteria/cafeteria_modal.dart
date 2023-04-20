import 'package:cloud_firestore/cloud_firestore.dart';

class CafeteriaModal {
  final String stockName;
  final String stockPresent;
  final String stockIn;
  final String stockOut;
  final String closingStock;
  final String reorderRequired;

  CafeteriaModal({
    required this.stockName,
    required this.stockPresent,
    required this.stockIn,
    required this.stockOut,
    required this.closingStock,
    required this.reorderRequired,
  });

  factory CafeteriaModal.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CafeteriaModal(
      stockName: snapshot["stockName"],
      stockPresent: snapshot["stockPresent"],
      stockIn: snapshot["stockIn"],
      stockOut: snapshot["stockOut"],
      closingStock: snapshot["closingStock"],
      reorderRequired: snapshot["reorderRequired"],
    );
  }

  Map<String, dynamic> toJson() => {
        "stockName": stockName,
        "stockPresent": stockPresent,
        "stockIn": stockIn,
        "stockOut": stockOut,
        "closingStock": closingStock,
        "reorderRequired": reorderRequired,
      };
}

import 'package:cloud_firestore/cloud_firestore.dart';

class CafeteriaModal {
  final String stockName;
  final String stockPresent;
  final String stockUsed;
  final String stockRemaining;
  final String stockNeeded;
  final String dateTime;

  CafeteriaModal({
    required this.stockName,
    required this.stockPresent,
    required this.stockUsed,
    required this.stockRemaining,
    required this.stockNeeded,
    required this.dateTime,
  });

  factory CafeteriaModal.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CafeteriaModal(
        stockName: snapshot["stockName"],
        stockPresent: snapshot["stockPresent"],
        stockUsed: snapshot["stockUsed"],
        stockRemaining: snapshot["stockRemaining"],
        stockNeeded: snapshot["stockNeeded"],
        dateTime: snapshot['dateTime']);
  }

  Map<String, dynamic> toJson() => {
        "stockName": stockName,
        "stockPresent": stockPresent,
        "stockUsed": stockUsed,
        "stockRemaining": stockRemaining,
        "stockNeeded": stockNeeded,
        "dateTime": dateTime
      };
}

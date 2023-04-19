import 'package:cloud_firestore/cloud_firestore.dart';

class CafeteriaModal {
  final String stockName;
  final String stockPresent;
  final String stockUsed;
  final String stockRemaining;
  final String stockNeeded;

  CafeteriaModal({
    required this.stockName,
    required this.stockPresent,
    required this.stockUsed,
    required this.stockRemaining,
    required this.stockNeeded,
  });

  factory CafeteriaModal.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CafeteriaModal(
        stockName: snapshot["ahuId"],
        stockPresent: snapshot["ahuName"],
        stockUsed: snapshot["centerName"],
        stockRemaining: snapshot["floorNumber"],
        stockNeeded: snapshot["ahuOperationalDays"]);
  }

  Map<String, dynamic> toJson() => {
        "ahuId": stockName,
        "ahuName": stockPresent,
        "centerName": stockUsed,
        "floorNumber": stockRemaining,
        "ahuOperationalDays": stockNeeded,
      };
}

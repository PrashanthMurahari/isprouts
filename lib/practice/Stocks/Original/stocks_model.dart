import 'package:cloud_firestore/cloud_firestore.dart';

class StocksModel {
  final String stockName;
  final String stockId;
  final String units;
  final String itemIn;
  final String itemOut;
  final String currentStock;
  final String reOrder;

  StocksModel({
    required this.stockName,
    required this.stockId,
    required this.units,
    required this.itemIn,
    required this.itemOut,
    required this.currentStock,
    required this.reOrder,
  });

  factory StocksModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return StocksModel(
      stockName: snapshot['stockName'],
      stockId: snapshot['stockId'],
      units: snapshot['units'],
      itemIn: snapshot['itemIn'],
      itemOut: snapshot['itemOut'],
      currentStock: snapshot['currentStock'],
      reOrder: snapshot['reOrder'],
    );
  }

  Map<String, dynamic> toJson() =>
      {"stockName": stockName,
        "stockId": stockId,
        "units": units,
        "itemIn": itemIn,
        "itemOut": itemOut,
        "currentStock": currentStock,
        "reOrder": reOrder,
      };
}

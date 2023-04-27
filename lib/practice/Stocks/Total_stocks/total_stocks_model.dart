import 'package:cloud_firestore/cloud_firestore.dart';

class TotalStocksModel {
  final String itemId;
  final String itemName;
  final String itemIn;
  final String itemOut;
  final String currentStock;
  final String reOrder;

  TotalStocksModel({
    required this.itemId,
    required this.itemName,
    required this.itemIn,
    required this.itemOut,
    required this.currentStock,
    required this.reOrder,
  });

  factory TotalStocksModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return TotalStocksModel(
      itemId: snapshot['itemId'],
      itemName: snapshot['itemName'],
      itemIn: snapshot['itemIn'],
      itemOut: snapshot['itemOut'],
      currentStock: snapshot['currentStock'],
      reOrder: snapshot['reOrder'],
    );
  }

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemName": itemName,
        "itemIn": itemIn,
        "itemOut": itemOut,
        "currentStock": currentStock,
        "reOrder": reOrder
      };
}

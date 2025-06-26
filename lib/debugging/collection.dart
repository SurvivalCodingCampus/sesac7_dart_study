import 'dart:convert';

import 'package:modu_3_dart_study/debugging/sale_log.dart';

class Collection {
  final String _collectionName;
  final List<SaleLog> _collectionSalePrice = [];
  final List<Map<String, dynamic>> salePriceList = [];
  List<dynamic> salePriceList2 = [];

  // 생성자
  Collection({
    required String collectionName,
  }) : _collectionName = collectionName;

  // getter
  String get collectionName => _collectionName;

  // 직렬화
  Map<String, dynamic> toJson() {
    _collectionSalePrice.forEach((e) => salePriceList.add(e.toJson()));

    return {
      'collectionName': collectionName,
      'collectionSalePrice': salePriceList,
    };
  }

  // 역직렬화
  Collection.fromJson(Map<String, dynamic> json)
    : _collectionName = json['collectionName'],
      salePriceList2 = json['collectionSalePrice'] {
    salePriceList2.forEach((e) => SaleLog.fromJson(e));
  }
}

void main() {
  SaleLog s1 = SaleLog(
    price: 58.25,
    cvtDateTime: DateTime(1991, 08, 21, 10, 08, 31),
  );
  SaleLog s2 = SaleLog(
    price: 58.25,
    cvtDateTime: DateTime(1991, 08, 21, 10, 08, 31),
  );

  Collection c = Collection(collectionName: 'collection1');

  final String bbbb = ''' {
      "collectionName": "collection1",
      "collectionSalePrice": [
        {
          "price": 58.25,
          "cvtDatetime": "2023-03-26T08:00:00"
        },
        {
          "price": 58.50,
          "cvtDatetime": "2023-03-26T08:00:10"
        }
      ]
    }''';
  Map<String, dynamic> jsonMap = c.toJson();
  Map<String, dynamic> cccc = jsonDecode(bbbb);
  Collection pe = Collection.fromJson(cccc);
  print(pe);
}

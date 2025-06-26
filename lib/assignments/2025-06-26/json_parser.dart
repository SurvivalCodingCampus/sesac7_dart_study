import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

class PriceData {
  double price;
  DateTime cvtDatetime;

  PriceData(this.price, this.cvtDatetime);

  PriceData.fromJson(Map<String, dynamic> json)
    : price = json['price'] ?? 0.0,
      cvtDatetime =
          DateTime.tryParse(json['cvtDatetime'] ?? "0000-01-01") ??
          DateTime(0, 1, 1);

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatetime': DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(cvtDatetime),
    };
  }
}

class PriceCollection {
  String collectionName;
  List<PriceData>? collectionSalePrice;

  PriceCollection(this.collectionName);

  PriceCollection.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'] ?? '',
      collectionSalePrice = ((json['collectionSalePrice'] ?? []) as List)
          .map((e) => PriceData.fromJson(e))
          .toList();

  Map<String, dynamic> toJson() {
    if (collectionSalePrice == null) {
      return {'collectionName': collectionName, 'collectionSalePrice': []};
    }
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice!
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

class CollectionList {
  List<PriceCollection>? collectionChartDataList;

  CollectionList();

  CollectionList.fromJson(Map<String, dynamic> json)
    : collectionChartDataList =
          ((json['collectionChartDataList'] ?? []) as List)
              .map((e) => PriceCollection.fromJson(e))
              .toList();

  Map<String, dynamic> toJson() {
    if (collectionChartDataList == null) {
      return {};
    }
    return {
      'collectionChartDataList': collectionChartDataList!
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

void main() {
  try {
    final file = File('lib/assignments/2025-06-26/chart_data.json');
    final fileString = file.readAsStringSync();

    final jsonMap = jsonDecode(fileString);
    final dataChunk = CollectionList.fromJson(jsonMap);

    print(dataChunk);

    final saveFile = File('lib/assignments/2025-06-26/testResult.json');
    saveFile.writeAsStringSync(jsonEncode(dataChunk.toJson()));
  } catch (e) {
    print('Error: $e');
  }
}

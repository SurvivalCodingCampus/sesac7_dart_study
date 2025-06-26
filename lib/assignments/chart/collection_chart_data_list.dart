import 'dart:convert';
import 'dart:io';

class CollectionChartDataList {
  final List<CollectionChartData> items;

  const CollectionChartDataList({required this.items});

  factory CollectionChartDataList.fromJson(Map<String, dynamic> json) {
    final list = json['collectionChartDataList'] as List;
    final chartDataItems = list
        .map((item) => CollectionChartData.fromJson(item))
        .toList();

    return CollectionChartDataList(items: chartDataItems);
  }

  Map<String, dynamic> toJson() {
    return {
      'collectionChartDataList': items.map((item) => item.toJson()).toList(),
    };
  }
}

class CollectionChartData {
  final String collectionName;
  final List<CollectionSalePrice>? collectionSalePrice;

  const CollectionChartData({
    required this.collectionName,
    this.collectionSalePrice,
  });

  factory CollectionChartData.fromJson(Map<String, dynamic> json) {
    final salePriceList = json['collectionSalePrice'] != null
        ? (json['collectionSalePrice'] as List)
              .map((item) => CollectionSalePrice.fromJson(item))
              .toList()
        : null;

    return CollectionChartData(
      collectionName: json['collectionName'] as String,
      collectionSalePrice: salePriceList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice
          ?.map((item) => item.toJson())
          .toList(),
    };
  }
}

class CollectionSalePrice {
  final double price;
  final String cvtDatetime;

  const CollectionSalePrice({required this.price, required this.cvtDatetime});

  factory CollectionSalePrice.fromJson(Map<String, dynamic> json) {
    return CollectionSalePrice(
      price: (json['price'] as num).toDouble(),
      cvtDatetime: json['cvtDatetime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'price': price, 'cvtDatetime': cvtDatetime};
  }
}

void findCollection({
  required List<CollectionChartData> collections,
  required int collectionNumber,
}) {
  final targetName = 'collection$collectionNumber';
  CollectionChartData? foundCollection;

  for (final collection in collections) {
    if (collection.collectionName == targetName) {
      foundCollection = collection;
      break;
    }
  }
  if (foundCollection == null) {
    print('컬렉션을 찾을 수 없습니다');
    return;
  }

  final salesList = foundCollection.collectionSalePrice;
  if (salesList == null || salesList.isEmpty) {
    print('판매 내역이 없습니다');
    return;
  }

  for (final saleInfo in salesList) {
    print('가격: ${saleInfo.price}\n시간: ${saleInfo.cvtDatetime}');
  }
}

void main() {
  try {
    final file = File('chart_data.json');
    final jsonString = file.readAsStringSync();
    final jsonData = json.decode(jsonString);
    final response = CollectionChartDataList.fromJson(jsonData);

    findCollection(collections: response.items, collectionNumber: 1);
    findCollection(collections: response.items, collectionNumber: 55);
    findCollection(collections: response.items, collectionNumber: 1500);
  } catch (e) {
    print('오류가 발생했습니다: $e');
  }
}

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/12_debugging/collection_sale_price.dart';

class CollectionChartData {
  final String? collectionName;
  final List<CollectionSalePrice?>? collectionSalePrice;

  CollectionChartData(
    this.collectionName,
    this.collectionSalePrice,
  );

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = (json['collectionName'] ?? '') as String,
      collectionSalePrice = ((json['collectionSalePrice'] ?? []) as List)
          .map((e) => CollectionSalePrice.fromJson(e))
          .toList();

  Map<String, dynamic> toJson() => {
    'collectionName': collectionName,
    'collectionSalePrice': (collectionSalePrice ?? [])
        .map((e) => (e ?? CollectionSalePrice(0, '')).toJson())
        .toList(),
  };

  @override
  bool operator ==(Object other) {
    if (other is CollectionChartData) {
      return collectionName == other.collectionName &&
          ListEquality().equals(
            collectionSalePrice,
            other.collectionSalePrice,
          );
    }
    return false;
  }

  @override
  int get hashCode =>
      collectionName.hashCode ^ ListEquality().hash(collectionSalePrice);

  @override
  String toString() {
    return '{"collectionName": $collectionName, "collectionSalePrice": $collectionSalePrice}';
  }
}

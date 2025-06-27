import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/collection_chart/collection_sale_price.dart';

class CollectionChartData {
  static const String collectionNameString = 'collectionName';
  static const String collectionSalePriceString = 'collectionSalePrice';

  final String? collectionName;
  final List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartData({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json[collectionNameString],
      collectionSalePrice =
          (json[collectionSalePriceString] == null
                  ? null
                  : json[collectionSalePriceString] as List)
              ?.map((e) => e as Map<String, dynamic>)
              .map((e) => CollectionSalePrice.fromJson(e))
              .toList();

  Map<String, dynamic> toJson() {
    return {
      collectionNameString: collectionName,
      collectionSalePriceString: collectionSalePrice
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => Object.hash(collectionName, collectionSalePrice);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionChartData &&
          collectionName == other.collectionName &&
          ListEquality().equals(collectionSalePrice, other.collectionSalePrice);

  @override
  String toString() {
    return 'CollectionChartData{$collectionNameString: $collectionName, $collectionSalePriceString: $collectionSalePrice}\n';
  }
}

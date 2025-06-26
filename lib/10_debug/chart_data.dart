import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/10_debug/chart_data_list.dart';
import 'package:modu_3_dart_study/10_debug/sale_price.dart';

class ChartData {
  final String _collectionName;
  final List<SalePrice>? _collectionSalePrice;

  String get collectionName => _collectionName;

  List<SalePrice>? get collectionSalePrice => _collectionSalePrice;

  ChartData({
    required String collectionName,
    required List<SalePrice> collectionSalePrice,
  }) : _collectionName = collectionName,
       _collectionSalePrice = collectionSalePrice;

  ChartData.fromJson(Map<String, dynamic> json)
    : _collectionName = json['collectionName'],
      _collectionSalePrice =
          (json['collectionSalePrice'] as List?) // List<dynamic>
              ?.map(
                (e) => SalePrice.fromJson(e as Map<String, dynamic>),
              ) // Iterable<SalePrice>
              .toList(); // List<SalePrice>

  @override
  bool operator ==(Object other) {
    return other is ChartData
        ? collectionName == other.collectionName &&
              DeepCollectionEquality().equals(
                collectionSalePrice,
                other.collectionSalePrice,
              )
        : false;
  }

  // hashAll을 사용하면 Iterable 내부의 모든 요소들의 해시코드를 조합하여 하나의 해시코드를 생성한다.
  @override
  int get hashCode => Object.hash(
    collectionName,
    collectionSalePrice == null ? null : Object.hashAll(collectionSalePrice!),
  );

  @override
  String toString() =>
      'ChartData(collectionName: $collectionName, collectionSalePrice: $collectionSalePrice)';

  Map<String, dynamic> toJson() => {
    'collectionName': collectionName,
    'collectionSalePrice': collectionSalePrice?.map((e) => e.toJson()).toList(),
  };
}

void main() {
  final File chartDataJsonFile = File('json_data/chart_data.json');
  final String chartDataListJsonString = chartDataJsonFile.readAsStringSync();
  final Map<String, dynamic> chartDataListJsonDeserialize = jsonDecode(
    chartDataListJsonString,
  );
  final chartDataJsonList = ChartDataList.fromJson(
    chartDataListJsonDeserialize,
  );
  print(chartDataJsonList.toString());
}

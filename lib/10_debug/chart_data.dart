import 'dart:convert';
import 'dart:io';

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
              collectionSalePrice == other.collectionSalePrice
        : false;
  }

  // 여기 문제 있는거 같은데 리스트 해시코드 말고 다른 방법을 찾아야할 듯.
  // @override
  // int get hashCode => collectionName.hashCode ^ collectionSalePrice.hashCode;

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

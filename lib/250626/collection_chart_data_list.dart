import 'dart:convert';
import 'dart:io';

class CollectionChart {
  List<CollectionChartData> collectionChartDataList;

  CollectionChart.fromJson(Map<String, dynamic> json)
    : collectionChartDataList = (json['collectionChartDataList'] as List)
          .where(
            (e) =>
                e['collectionSalePrice'] != null && e['collectionName'] != null,
          )
          .map((e) => CollectionChartData.fromJson(e))
          .toList();
}

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice> collectionSalePriceList;

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePriceList = (json['collectionSalePrice'] as List)
          .where((e) => e['cvtDatetime'] != null && e['price'] != null)
          .map((e) => CollectionSalePrice.fromJson(e))
          .toList();
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = DateTime.parse(json['cvtDatetime']);
}

void main() {
  final file = File('asset/chart_data.json');
  String jsonString = file.readAsStringSync();
  Map<String, dynamic> json = jsonDecode(jsonString);
  final collectionChart = CollectionChart.fromJson(json);

  //출력
  collectionChart.collectionChartDataList.forEach(
    (e) => print('${e.collectionName} : ${e.collectionSalePriceList.length}'),
  );
}

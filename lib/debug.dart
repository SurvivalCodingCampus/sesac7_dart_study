import 'dart:convert';
import 'dart:io';

class CollectionSalePrice {
  double price;
  String cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> map)
  : price = map['price'] ?? 0,
  cvtDatetime = map['cvtDatetime'] ?? '';
}

class Chart {
  String collectionName;
  final List collectionSalePrice;
  
  // named 생성자
  Chart.fromJson(Map<String, dynamic> map)
    : collectionName = map['collectionName'] ?? '',
      collectionSalePrice = (map['collectionSalePrice'] ?? [])
      .map((item) => CollectionSalePrice.fromJson(item))
      .toList() ?? [];

      // json['collectionSalePrice'] 
      // List 안에 Map이 여러개 들어가 있는 구조
      // map 하나씩 CollectionSalePrice 객체로 바꿔줌
}

readJsonFile() {
  try {
    final jsonFile = File('lib/assets/chart_data.json').readAsStringSync();
    Map<String, dynamic> map = jsonDecode(jsonFile);

    final List<dynamic> list = map['collectionChartDataList'];
    final List<Chart> chartList = list.map((item) => Chart.fromJson(item)).toList();

    return chartList;
  } catch (e) {
    return print('Error $e');
  }
}

void main () {
  readJsonFile();
}
// {
// "price": 58.25,
// "cvtDatetime": "2023-03-26T08:00:00"
// }

import 'dart:convert';
import 'dart:io';

class CollectionSalePrice {
  double price;
  String cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = json['cvtDatetime'];
}

class CollectionChartDataList {
  String collectionName;
  List<CollectionSalePrice> collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  // CollectionChartDataList.fromJson(Map<String, dynamic> json)
  //   : collectionName = json['collectionName'],
  //     collectionSalePrice = CollectionSalePrice.fromJson(json['collectionSalePrice']);

  static CollectionChartDataList fromJson(Map<String, dynamic> json){
    List<CollectionSalePrice> collectionList = [];
    for(var data in json['collectionSalePrice']){
      collectionList.add(CollectionSalePrice.fromJson(data));
    }
    return CollectionChartDataList(collectionName: json['collectionName'], collectionSalePrice: collectionList);
  }
}

void main() {
  // sourcepath 파일을 열기
  final sourceFile = File('lib/lecture_code/debug/chart_data1.json');

  // sourcepath 파일을 읽기 => 읽은 내용을 저장하기
  String text = sourceFile.readAsStringSync();

  // JsonString -> Map
  //print(jsonDecode(text));
 List<CollectionSalePrice> list = CollectionChartDataList.fromJson(jsonDecode(text)).collectionSalePrice;

  for(var i in list){
    print(i.price);
  }

  //print(CollectionSalePrice.fromJson(jsonDecode(text)['collectionSalePrice'][0]).price);
  // print(CollectionSalePrice.fromJson(jsonDecode(text)['collectionSalePrice'][0]).cvtDatetime);
}

import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/debugging/collection.dart';
import 'package:modu_3_dart_study/debugging/sale_log.dart';

class ChartData {
  // Collection 타입 객체를 모아놓을 리스트.
  // 생성자의 인자를 통해 초기화할 때 사용한다.
  List<Collection> _collectionChartDataList = [];

  // 생성자
  ChartData({required List<Collection> collectionChartDataList})
    : _collectionChartDataList = collectionChartDataList;

  // 직렬화
  Map<String, List<Map<String, dynamic>>> toJson() {
    // 직렬화 시 사용할 리스트.
    // 각 Collection 객체는 Map<String, dynamic> 형태로 볼 수 있다.
    final List<Map<String, dynamic>> chartDataList = [];

    // _collectionChartDataList 내 Collection 객체들을 각각 Map의 형태로 바꾸고,
    // chartDataList에 모두 add하여 사용한다.
    _collectionChartDataList.forEach((e) => chartDataList.add(e.toJson()));

    return {'collectionChartDataList': chartDataList};
  }

  // 역직렬화
  ChartData.fromJson(Map<String, dynamic> json)
    : _collectionChartDataList =
          (json['collectionChartDataList'] as List<dynamic>?) // null에 대한 검증
              ?.map(
                (e) => Collection.fromJson(e as Map<String, dynamic>),
              ) // 각 element를 Collection 객체로 변환
              .toList() ??
          []; // List<Collection>으로 변환 및 null 처리
}

void main() {
  File file = File('lib/debugging/chart_data.json');
  String copyResult = file.readAsStringSync();

  Map<String, dynamic> decodeResult = jsonDecode(copyResult);
  ChartData q = ChartData.fromJson(decodeResult);

  SaleLog s2 = SaleLog(
    price: 58.25,
    cvtDateTime: DateTime(1991, 08, 21, 10, 08, 31),
  );

  Collection c = Collection(
    collectionName: 'collection1',
    collectionSalePrice: [s2],
  );

  ChartData ch = ChartData(collectionChartDataList: [c]);
  print(ch.toJson());
}

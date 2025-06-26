import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/debugging/collection.dart';

class ChartData {
  List<Collection> _collectionChartDataList = [];
  List<Map<String, dynamic>> chartDataList = [];
  List<dynamic> reverseSerializationList = [];

  // 생성자
  ChartData({required List<Collection> collectionChartDataList})
    : _collectionChartDataList = collectionChartDataList;

  // 직렬화
  Map<String, List<Map<String, dynamic>>> toJson() {
    _collectionChartDataList.forEach((e) => chartDataList.add(e.toJson()));

    return {'collectionChartDataList': chartDataList};
  }

  // 역직렬화
  ChartData.fromJson(Map<String, dynamic> json)
    : reverseSerializationList = json['collectionChartDataList'];

  // @override
  // String toString() {
  //   return '$hello';
  // }
}

void main() {
  File file = File('lib/debugging/chart_data.json');
  String copyResult = file.readAsStringSync();

  Map<String, dynamic> decodeResult = jsonDecode(copyResult);
  ChartData q = ChartData.fromJson(decodeResult);
  print(q.reverseSerializationList);
}

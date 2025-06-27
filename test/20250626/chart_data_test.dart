import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/20250626/chart_data.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('json에서 특정 데이터가 null일 경우', () {
    File file = File('chart_data.json');
    if (!file.existsSync()) {
      fail('chart_data.json 파일을 찾을 수 없습니다.');
    }
    String jsonString = file.readAsStringSync();

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    final collectionChartDataList = (jsonMap['collectionChartDataList'] as List<dynamic>)
        .map((e) => CollectionChartData.fromJson(e)).toList();

    for (final item in collectionChartDataList) {
      expect(item.collectionName.isNotEmpty , isTrue);
      print('item.collectionName : ${item.collectionName}');
    }

  });
}
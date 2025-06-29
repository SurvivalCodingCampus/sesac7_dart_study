import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/lecture_code/debug/debugex.dart';
import 'package:test/test.dart';

void main() {
  test('chart_data.json파일 읽고 확인 Test', () {
    //given(준비)
    final file = File("lib/lecture_code/debug/chart_data.json");
    final text = file.readAsStringSync();
    final Map<String, dynamic> json = jsonDecode(text);
    final chartData = ChartData.fromJson(json);

    //when(실행)

    //then(검증)
    expect(chartData.collectionChartDataList[0].collectionName, 'collection1');
    expect(chartData.collectionChartDataList[0].collectionSalePrice?[0].price, 58.25);
    expect(chartData.collectionChartDataList[0].collectionSalePrice?[0].cvtDataTime,'2023-03-26T08:00:00');
  });
}

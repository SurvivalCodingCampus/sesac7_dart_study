import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/12_debugging/char_data.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final String testJsonString = '''{
  "collectionChartDataList": [
    {
      "collectionName": "collection1",
      "collectionSalePrice": [
        {
          "price": 58.25,
          "cvtDatetime": "2023-03-26T08:00:00"
        },
        {
          "price": 58.50,
          "cvtDatetime": "2023-03-26T08:00:10"
        }
      ]
    },
    {
      "collectionName": "collection2",
      "collectionSalePrice": [
        {
          "price": 58.75,
          "cvtDatetime": "2023-03-26T08:00:20"
        },
        {
          "price": 59.00,
          "cvtDatetime": "2023-03-26T08:00:30"
        }
      ]
    }
    ]
    }''';
  final testJson = jsonDecode(testJsonString);
  final String path = 'chart_data.json';
  final realJson = jsonDecode(File(path).readAsStringSync());

  final firstTestChartItem = testJson['collectionChartDataList'][0];
  final firstRealChartItem = realJson['collectionChartDataList'][0];

  final testCollectionName = firstTestChartItem['collectionName'];
  final realCollectionName = firstRealChartItem['collectionName'];

  final testFirstSalePrice = firstTestChartItem['collectionSalePrice'][0];
  final realFirstSalePrice = firstRealChartItem['collectionSalePrice'][0];

  test('ChartData Json 직렬화 테스트', () {
    expect(
      MapEquality().equals(testFirstSalePrice, realFirstSalePrice),
      isTrue,
    );
    expect(testCollectionName, equals(realCollectionName));
  });

  test('ChartData Json 역직렬화 테스트', () {
    final testChartDataList = testJson['collectionChartDataList'][0];
    final testCollectionName = 'collection1';
    final testSalePrice =
        testJson['collectionChartDataList'][0]['collectionSalePrice'][0];
    final testPrice = 58.25;
    final testCvtDateTime = '2023-03-26T08:00:00';
    final chartData1 = ChartData.fromJson(realJson);
    final realChartDataList = chartData1.collectionChartDataList[0];
    final realCollectionName = realChartDataList.collectionName;
    final realSalePrice = realChartDataList.collectionSalePrice[0];
    final realPrice = realSalePrice.price;
    final realCvtDateTime = realSalePrice.cvtDatetime;

    expect(realChartDataList == testChartDataList, equals(true));
    expect(realCollectionName == testCollectionName, equals(true));
    expect(realSalePrice == testSalePrice, equals(true));
    expect(realPrice == testPrice, equals(true));
    expect(realCvtDateTime == testCvtDateTime, equals(true));
  });
}

import 'dart:convert';

import 'package:modu_3_dart_study/10_debug/chart_data.dart';
import 'package:modu_3_dart_study/10_debug/chart_data_list.dart';
import 'package:modu_3_dart_study/10_debug/sale_price.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  const String collectionChartDataListKey = 'collectionChartDataList';
  const String collectionNameKey = 'collectionName';
  const String collectionSalePriceKey = 'collectionSalePrice';
  const String priceKey = 'price';
  const String cvtDatetimeKey = 'cvtDatetime';

  // collectionSalePriceFirstItem
  const String collectionNameFirst = 'collection1';
  const String collectionSalePriceFirstItemFirstPrice = '58.25';
  const String collectionSalePriceFirstItemSecondPrice = '58.50';
  const String collectionSalePriceFirstItemFirstCvtDatetime = '2023-03-26T08:00:00';
  const String collectionSalePriceFirstItemSecondCvtDatetime = '2023-03-26T08:00:10';

  // collectionSalePriceSecondItem
  const String collectionNameSecond = 'collection2';
  const String collectionSalePriceSecondItemFirstPrice = '58.75';
  const String collectionSalePriceSecondItemSecondPrice = '59.00';
  const String collectionSalePriceSecondItemFirstCvtDatetime = '2023-03-26T08:00:20';
  const String collectionSalePriceSecondItemSecondCvtDatetime = '2023-03-26T08:00:30';

  const String testJsonString = '''
    {
      "$collectionChartDataListKey": [
        {
          "$collectionNameKey": "$collectionNameFirst",
          "$collectionSalePriceKey": [
            {
              "$priceKey": $collectionSalePriceFirstItemFirstPrice,
              "$cvtDatetimeKey": "$collectionSalePriceFirstItemFirstCvtDatetime"
            },
            {
              "$priceKey": $collectionSalePriceFirstItemSecondPrice,
              "$cvtDatetimeKey": "$collectionSalePriceFirstItemSecondCvtDatetime"
            }
          ]
        },
        {
          "$collectionNameKey": "$collectionNameSecond",
          "$collectionSalePriceKey": [
            {
              "$priceKey": $collectionSalePriceSecondItemFirstPrice,
              "$cvtDatetimeKey": "$collectionSalePriceSecondItemFirstCvtDatetime"
            },
            {
              "$priceKey": $collectionSalePriceSecondItemSecondPrice,
              "$cvtDatetimeKey": "$collectionSalePriceSecondItemSecondCvtDatetime"
            }
          ]
        }
      ]
    }
  ''';
  const String testJsonStringCollectionSalePriceEmpty = '''
    {
      "$collectionChartDataListKey": [
        {
          "$collectionNameKey": "$collectionNameFirst"
        }
      ]
    }
  ''';

  group('ChartDataList fromJson Test', () {
    test('fromJson으로 만들어진 객체의 값이 JsonString과 동일한지 검증', () {
      final Map<String, dynamic> jsonMap = jsonDecode(testJsonString);
      final ChartDataList chartDataList = ChartDataList.fromJson(jsonMap);
      final ChartData chartDataFirstItem = chartDataList.collectionChartDataList[0];
      final ChartData chartDataSecondItem = chartDataList.collectionChartDataList[1];
      final SalePrice? chartDataFirstSalePriceFirstItem = chartDataFirstItem.collectionSalePrice?[0];
      final SalePrice? chartDataFirstSalePriceSecondItem = chartDataFirstItem.collectionSalePrice?[1];
      final SalePrice? chartDataSecondSalePriceFirstItem = chartDataSecondItem.collectionSalePrice?[0];
      final SalePrice? chartDataSecondSalePriceSecondItem = chartDataSecondItem.collectionSalePrice?[1];

      expect(chartDataFirstItem.collectionName, equals(collectionNameFirst));
      expect(chartDataSecondItem.collectionName, equals(collectionNameSecond));
      expect(chartDataFirstSalePriceFirstItem?.price, equals(double.parse(collectionSalePriceFirstItemFirstPrice)));
      expect(chartDataFirstSalePriceFirstItem?.cvtDatetime, equals(DateTime.parse(collectionSalePriceFirstItemFirstCvtDatetime)));
      expect(chartDataFirstSalePriceSecondItem?.price, equals(double.parse(collectionSalePriceFirstItemSecondPrice)));
      expect(chartDataFirstSalePriceSecondItem?.cvtDatetime, equals(DateTime.parse(collectionSalePriceFirstItemSecondCvtDatetime)));
      expect(chartDataSecondSalePriceFirstItem?.price, equals(double.parse(collectionSalePriceSecondItemFirstPrice)));
      expect(chartDataSecondSalePriceFirstItem?.cvtDatetime, equals(DateTime.parse(collectionSalePriceSecondItemFirstCvtDatetime)));
      expect(chartDataSecondSalePriceSecondItem?.price, equals(double.parse(collectionSalePriceSecondItemSecondPrice)));
      expect(chartDataSecondSalePriceSecondItem?.cvtDatetime, equals(DateTime.parse(collectionSalePriceSecondItemSecondCvtDatetime)));
    });

    test('fromJson으로 만들어진 객체의 collectionSalePrice JsonList가 없는 경우 객체 생성 검증', () {
      final Map<String, dynamic> jsonMap = jsonDecode(testJsonStringCollectionSalePriceEmpty);
      final ChartDataList chartDataList = ChartDataList.fromJson(jsonMap);
      final ChartData chartDataFirstItem = chartDataList.collectionChartDataList[0];
      final SalePrice? chartDataFirstSalePriceFirstItem = chartDataFirstItem.collectionSalePrice?[0];

      expect(chartDataFirstSalePriceFirstItem, isNull);
    });
  });

  group('ChartDataList toJson Test', () {
    test('객체를 toJson한 Map의 값이 객체 필드값과 동일한지 검증', () {
      final SalePrice chartDataFirstSalePriceFirstItem = SalePrice(price: double.parse(collectionSalePriceFirstItemFirstPrice), cvtDateTime: DateTime.parse(collectionSalePriceFirstItemFirstCvtDatetime));
      final SalePrice chartDataFirstSalePriceSecondItem = SalePrice(price: double.parse(collectionSalePriceFirstItemSecondPrice), cvtDateTime: DateTime.parse(collectionSalePriceFirstItemSecondCvtDatetime));
      final List<SalePrice> chartDataFirstSalePriceCollection = [chartDataFirstSalePriceFirstItem, chartDataFirstSalePriceSecondItem];
      final SalePrice chartDataSecondSalePriceFirstItem = SalePrice(price: double.parse(collectionSalePriceSecondItemFirstPrice), cvtDateTime: DateTime.parse(collectionSalePriceSecondItemFirstCvtDatetime));
      final SalePrice chartDataSecondSalePriceSecondItem = SalePrice(price: double.parse(collectionSalePriceSecondItemSecondPrice), cvtDateTime: DateTime.parse(collectionSalePriceSecondItemSecondCvtDatetime));
      final List<SalePrice> chartDataSecondSalePriceCollection = [chartDataSecondSalePriceFirstItem, chartDataSecondSalePriceSecondItem];

      final ChartData chartDataFirstItem = ChartData(collectionName: collectionNameFirst, collectionSalePrice: chartDataFirstSalePriceCollection);
      final ChartData chartDataSecondItem = ChartData(collectionName: collectionNameSecond, collectionSalePrice: chartDataSecondSalePriceCollection);

      final ChartDataList chartDataList = ChartDataList(collectionChartDataList: [chartDataFirstItem, chartDataSecondItem]);

      final Map<String, dynamic> charDataListJsonMap = chartDataList.toJson();

      expect((charDataListJsonMap[collectionChartDataListKey] as List), isA<List>());
      expect((charDataListJsonMap[collectionChartDataListKey] as List).length, 2);

      final collectionSalePrice01 = (charDataListJsonMap[collectionChartDataListKey] as List)[0] as Map<String, dynamic>;
      final collectionSalePrice02 = (charDataListJsonMap[collectionChartDataListKey] as List)[1] as Map<String, dynamic>;

      expect((collectionSalePrice01[collectionSalePriceKey] as List)[0][priceKey], double.parse(collectionSalePriceFirstItemFirstPrice));
      expect((collectionSalePrice01[collectionSalePriceKey] as List)[0][cvtDatetimeKey], collectionSalePriceFirstItemFirstCvtDatetime);
      expect((collectionSalePrice01[collectionSalePriceKey] as List)[1][priceKey], double.parse(collectionSalePriceFirstItemSecondPrice));
      expect((collectionSalePrice01[collectionSalePriceKey] as List)[1][cvtDatetimeKey], collectionSalePriceFirstItemSecondCvtDatetime);
      expect((collectionSalePrice02[collectionSalePriceKey] as List)[0][priceKey], double.parse(collectionSalePriceSecondItemFirstPrice));
      expect((collectionSalePrice02[collectionSalePriceKey] as List)[0][cvtDatetimeKey], collectionSalePriceSecondItemFirstCvtDatetime);
      expect((collectionSalePrice02[collectionSalePriceKey] as List)[1][priceKey], double.parse(collectionSalePriceSecondItemSecondPrice));
      expect((collectionSalePrice02[collectionSalePriceKey] as List)[1][cvtDatetimeKey], collectionSalePriceSecondItemSecondCvtDatetime);
    });
  });
}
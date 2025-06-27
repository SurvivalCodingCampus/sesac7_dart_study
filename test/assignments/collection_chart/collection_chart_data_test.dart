import 'package:modu_3_dart_study/assignments/collection_chart/collection_chart_data.dart';
import 'package:modu_3_dart_study/assignments/collection_chart/collection_sale_price.dart';
import 'package:test/test.dart';

void main() {
  final expectedName = 'collection1';
  final expectedPrice = 58.25;
  final expectedCvtDatetime = DateTime(2023, 3, 26, 8);
  final expectedCollectionSalePrice = [
    CollectionSalePrice(
      price: expectedPrice,
      cvtDatetime: expectedCvtDatetime,
    ),
  ];
  final json = {
    "collectionName": expectedName,
    "collectionSalePrice": [
      {"price": expectedPrice, "cvtDatetime": "2023-03-26T08:00:00"},
    ],
  };

  group('constructor', () {
    test(
      'When create a CollectionChartData, collectionName and collectionSalePrice are given values.',
      () {
        // given

        // when
        final collectionChartData = CollectionChartData(
          collectionName: expectedName,
          collectionSalePrice: expectedCollectionSalePrice,
        );

        // then
        expect(collectionChartData.collectionName, expectedName);
        expect(
          collectionChartData.collectionSalePrice,
          expectedCollectionSalePrice,
        );
      },
    );

    test(
      'If create a CollectionChartData when collectionName is null, collectionSalePrice is the given value.',
      () {
        // given
        // when
        final collectionChartData = CollectionChartData(
          collectionName: null,
          collectionSalePrice: expectedCollectionSalePrice,
        );

        // then
        expect(collectionChartData.collectionName, null);
        expect(
          collectionChartData.collectionSalePrice,
          expectedCollectionSalePrice,
        );
      },
    );

    test(
      'If create a CollectionChartData when collectionSalePrice is null, collectionName is the given value.',
      () {
        // given
        // when
        final collectionChartData = CollectionChartData(
          collectionName: expectedName,
          collectionSalePrice: null,
        );

        // then
        expect(collectionChartData.collectionName, expectedName);
        expect(collectionChartData.collectionSalePrice, null);
      },
    );

    test(
      'If create a CollectionChartData when collectionName and collectionSalePrice are null, there are given value.',
      () {
        // given
        // when
        final collectionChartData = CollectionChartData(
          collectionName: null,
          collectionSalePrice: null,
        );

        // then
        expect(collectionChartData.collectionName, null);
        expect(collectionChartData.collectionSalePrice, null);
      },
    );
  });

  group('fromJson', () {
    test('When json is fine, fromJson works fine.', () {
      // given

      // when
      final collectionChartData = CollectionChartData.fromJson(json);

      // then
      expect(collectionChartData.collectionName, expectedName);
      expect(
        collectionChartData.collectionSalePrice,
        expectedCollectionSalePrice,
      );
    });
  });

  group('toJson', () {
    test(
      'When CollectionChartData has all values, the Map returned by toJson will also have the same values.',
      () {
        // given
        final collectionChartData = CollectionChartData(
          collectionName: expectedName,
          collectionSalePrice: expectedCollectionSalePrice,
        );

        // when
        final json = collectionChartData.toJson();

        // then
        expect(
          collectionChartData.collectionName,
          json[CollectionChartData.collectionNameString],
        );
        expect(
          collectionChartData.collectionSalePrice?.first.toJson(),
          (json[CollectionChartData.collectionSalePriceString] as List).first,
        );
      },
    );
  });
}

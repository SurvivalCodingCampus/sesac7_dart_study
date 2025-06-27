import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/collection_chart/collection_chart_data.dart';
import 'package:modu_3_dart_study/assignments/collection_chart/collection_chart_dto.dart';
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
  final expectedCollectionChartDataList = [
    CollectionChartData(
      collectionName: expectedName,
      collectionSalePrice: expectedCollectionSalePrice,
    ),
  ];
  final json = {
    "collectionChartDataList": [
      {
        "collectionName": "collection1",
        "collectionSalePrice": [
          {"price": expectedPrice, "cvtDatetime": "2023-03-26T08:00:00"},
        ],
      },
    ],
  };

  group('constructor', () {
    test(
      'When create a CollectionChartDTO, collectionChartDataList is given values.',
      () {
        // given
        // when
        final collectionChartDTO = CollectionChartDTO(
          collectionChartDataList: expectedCollectionChartDataList,
        );

        // then
        expect(
          collectionChartDTO.collectionChartDataList,
          expectedCollectionChartDataList,
        );
      },
    );

    test(
      'If create a CollectionChartDTO when collectionChartDataList is null, collectionChartDataList is the given value.',
      () {
        // given
        // when
        final collectionChartDTO = CollectionChartDTO(
          collectionChartDataList: null,
        );

        // then
        expect(
          collectionChartDTO.collectionChartDataList,
          null,
        );
      },
    );
  });

  group('fromJson', () {
    test('When json is fine, fromJson works fine.', () {
      // given

      // when
      final collectionChartDTO = CollectionChartDTO.fromJson(json);

      // then
      expect(
        ListEquality().equals(
          collectionChartDTO.collectionChartDataList,
          expectedCollectionChartDataList,
        ),
        isTrue,
      );
    });
  });

  group('toJson', () {
    test(
      'When CollectionChartDTO has all values, the Map returned by toJson will also have the same values.',
      () {
        // given
        final collectionChartDTO = CollectionChartDTO(
          collectionChartDataList: expectedCollectionChartDataList,
        );

        // when
        final json = collectionChartDTO.toJson();

        // then
        expect(
          collectionChartDTO.collectionChartDataList?.first.toJson(),
          (json[CollectionChartDTO.collectionChartDataListString] as List)
              .first,
        );
      },
    );
  });
}

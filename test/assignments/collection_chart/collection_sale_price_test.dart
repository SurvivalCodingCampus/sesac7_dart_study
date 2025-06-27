import 'package:modu_3_dart_study/assignments/collection_chart/collection_sale_price.dart';
import 'package:test/test.dart';

void main() {
  final expectedPrice = 58.25;
  final expectedCvtDatetime = DateTime(2023, 3, 26, 8);
  final json = {
    "price": expectedPrice,
    "cvtDatetime": "2023-03-26T08:00:00",
  };

  group('constructor', () {
    test(
      'When create a CollectionSalePrice, price and cvtDatetime are given values.',
      () {
        // given
        // when
        final collectionSalePrice = CollectionSalePrice(
          price: expectedPrice,
          cvtDatetime: expectedCvtDatetime,
        );

        // then
        expect(collectionSalePrice.price, expectedPrice);
        expect(collectionSalePrice.cvtDatetime, expectedCvtDatetime);
      },
    );

    test(
      'If create a CollectionSalePrice when price is null, cvtDatetime is the given value.',
      () {
        // given
        // when
        final collectionSalePrice = CollectionSalePrice(
          price: null,
          cvtDatetime: expectedCvtDatetime,
        );

        // then
        expect(collectionSalePrice.price, null);
        expect(collectionSalePrice.cvtDatetime, expectedCvtDatetime);
      },
    );

    test(
      'If create a CollectionSalePrice when cvtDatetime is null, price is the given value.',
      () {
        // given
        // when
        final collectionSalePrice = CollectionSalePrice(
          price: expectedPrice,
          cvtDatetime: null,
        );

        // then
        expect(collectionSalePrice.price, expectedPrice);
        expect(collectionSalePrice.cvtDatetime, null);
      },
    );

    test(
      'If create a CollectionSalePrice when price and cvtDatetime are null, there are given value.',
      () {
        // given
        // when
        final collectionSalePrice = CollectionSalePrice(
          price: null,
          cvtDatetime: null,
        );

        // then
        expect(collectionSalePrice.price, null);
        expect(collectionSalePrice.cvtDatetime, null);
      },
    );
  });

  group('fromJson', () {
    test('When json is fine, fromJson works fine.', () {
      // given

      // when
      final collectionSalePrice = CollectionSalePrice.fromJson(json);

      // then
      expect(collectionSalePrice.price, expectedPrice);
      expect(collectionSalePrice.cvtDatetime, expectedCvtDatetime);
    });
  });

  group('toJson', () {
    test(
      'When CollectionSalePrice has all values, the Map returned by toJson will also have the same values.',
      () {
        // given
        final collectionSalePrice = CollectionSalePrice(
          price: expectedPrice,
          cvtDatetime: expectedCvtDatetime,
        );

        // when
        final json = collectionSalePrice.toJson();

        // then
        expect(
          collectionSalePrice.price,
          json[CollectionSalePrice.priceString],
        );
        expect(
          collectionSalePrice.cvtDatetime,
          json[CollectionSalePrice.cvtDatetimeString],
        );
      },
    );
  });
}

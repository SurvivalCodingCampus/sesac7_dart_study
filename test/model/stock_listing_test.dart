import 'package:modu_3_dart_study/model/stock_listing.dart';
import 'package:test/test.dart';

void main() {
  final expectedSymbol = "A";
  final expectedName = "Agilent Technologies Inc";
  final expectedExchange = "NYSE";
  final expectedAssetType = "Stock";
  final expectedIpoDate = "1999-11-18";
  final expectedDelistingDate = "null";
  final expectedStatus = "Active";
  final expectedCsv =
      'A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active';
  final stockListing = StockListing(
    symbol: expectedSymbol,
    name: expectedName,
    exchange: expectedExchange,
    assetType: expectedAssetType,
    ipoDate: expectedIpoDate,
    delistingDate: expectedDelistingDate,
    status: expectedStatus,
  );

  group(
    'constructor',
    () {
      test(
        'When create a StockListing, the symbol, name, exchange, assetType, ipoDate, delistingDate and status are given values.',
        () {
          // given
          // when

          // then
          expect(stockListing.symbol, expectedSymbol);
          expect(stockListing.name, expectedName);
          expect(stockListing.exchange, expectedExchange);
          expect(stockListing.assetType, expectedAssetType);
          expect(stockListing.ipoDate, expectedIpoDate);
          expect(stockListing.delistingDate, expectedDelistingDate);
          expect(stockListing.status, expectedStatus);
        },
      );

      test(
        'When create a StockListing with all values null, the symbol, name, exchange, assetType, ipoDate, delistingDate and status are null.',
        () {
          // given
          // when
          final stockListing = StockListing(
            symbol: null,
            name: null,
            exchange: null,
            assetType: null,
            ipoDate: null,
            delistingDate: null,
            status: null,
          );

          // then
          expect(stockListing.symbol, null);
          expect(stockListing.name, null);
          expect(stockListing.exchange, null);
          expect(stockListing.assetType, null);
          expect(stockListing.ipoDate, null);
          expect(stockListing.delistingDate, null);
          expect(stockListing.status, null);
        },
      );
    },
  );

  group('fromCsv', () {
    test(
      'If the csv contains all the values and create StockListing.fromCsv, the symbol, name, exchange, assetType, ipoDate, delistingDate and status are the given values.',
      () {
        // given

        // when
        final stockListing = StockListing.fromCsv(expectedCsv);

        // then
        expect(stockListing.symbol, expectedSymbol);
        expect(stockListing.name, expectedName);
        expect(stockListing.exchange, expectedExchange);
        expect(stockListing.assetType, expectedAssetType);
        expect(stockListing.ipoDate, expectedIpoDate);
        expect(stockListing.delistingDate, expectedDelistingDate);
        expect(stockListing.status, expectedStatus);
      },
    );

    test(
      'If all values in the csv are null and create StockListing.fromCsv, the symbol, name, exchange, assetType, ipoDate, delistingDate and status are the given values.',
      () {
        // given
        final csv = '';

        // when
        final stockListing = StockListing.fromCsv(csv);

        // then
        expect(stockListing.symbol, null);
        expect(stockListing.name, null);
        expect(stockListing.exchange, null);
        expect(stockListing.assetType, null);
        expect(stockListing.ipoDate, null);
        expect(stockListing.delistingDate, null);
        expect(stockListing.status, null);
      },
    );
  });

  group('toCsv', () {
    test(
      'If stockListing has all values, the result of toCsv is the same as expectedCsv.',
      () {
        // given

        // when
        final result = stockListing.toCsv();

        // then
        expect(result, expectedCsv);
      },
    );
  });

  group('copyWith', () {
    test(
      'If stockListing contains all values and copyWith is performed, the copied stockListing is a different object and has the same values.',
      () {
        // given

        // when
        final copied = stockListing.copyWith();

        // then
        expect(identical(stockListing, copied), isFalse);
        expect(stockListing == copied, isTrue);
      },
    );

    test(
      'If stockListing contains all the values and you do a copyWith with a new symbol, the copied stockListing will have a different symbol.',
      () {
        // given
        final newSymbol = 'B';

        // when
        final copied = stockListing.copyWith(symbol: newSymbol);

        // then
        expect(identical(stockListing, copied), isFalse);
        expect(copied.symbol, newSymbol);
        expect(copied.name, expectedName);
        expect(copied.exchange, expectedExchange);
        expect(copied.assetType, expectedAssetType);
        expect(copied.ipoDate, expectedIpoDate);
        expect(copied.delistingDate, expectedDelistingDate);
        expect(copied.status, expectedStatus);
      },
    );
  });
}

import 'package:modu_3_dart_study/data_source_study/model/stock_listing.dart';
import 'package:test/test.dart';

void main() {
  group('Geo Test', () {
    test('생성자 테스트', () {
      // given
      final String testSymbol = 'A';
      final String testName = 'Agilent Technologies Inc';
      final String testExchange = 'NYSE';
      final String testAssetType = 'Stock';
      final String testIpoDate = '1999-11-18';
      final String testDelistingDate = 'null';
      final String testStatus = 'Active';
      final StockListing testStockListing = StockListing(
        symbol: testSymbol,
        name: testName,
        exchange: testExchange,
        assetType: testAssetType,
        ipoDate: testIpoDate,
        delistingDate: testDelistingDate,
        status: testStatus,
      );

      // when & then
      expect(testStockListing.symbol != 'undefined', isTrue);
      expect(testStockListing.symbol, equals(testSymbol));

      expect(testStockListing.name != 'undefined', isTrue);
      expect(testStockListing.name, equals(testName));

      expect(testStockListing.exchange != 'undefined', isTrue);
      expect(testStockListing.exchange, equals(testExchange));

      expect(testStockListing.assetType != 'undefined', isTrue);
      expect(testStockListing.assetType, equals(testAssetType));

      expect(testStockListing.ipoDate != 'undefined', isTrue);
      expect(testStockListing.ipoDate, equals(testIpoDate));

      expect(testStockListing.delistingDate != 'undefined', isTrue);
      expect(testStockListing.delistingDate, equals(testDelistingDate));

      expect(testStockListing.status != 'undefined', isTrue);
      expect(testStockListing.status, equals(testStatus));
    });

    test('인자 값이 모두 공백일 때 undefined로 값이 잘 들어가는가?', () {
      final String testSymbol = '';
      final String testName = '';
      final String testExchange = '';
      final String testAssetType = '';
      final String testIpoDate = '';
      final String testDelistingDate = '';
      final String testStatus = '';
      final StockListing testStockListing = StockListing(
        symbol: testSymbol,
        name: testName,
        exchange: testExchange,
        assetType: testAssetType,
        ipoDate: testIpoDate,
        delistingDate: testDelistingDate,
        status: testStatus,
      );

      // when & then
      expect(testStockListing.symbol == 'undefined', isTrue);
      expect(testStockListing.name == 'undefined', isTrue);
      expect(testStockListing.exchange == 'undefined', isTrue);
      expect(testStockListing.assetType == 'undefined', isTrue);
      expect(testStockListing.ipoDate == 'undefined', isTrue);
      expect(testStockListing.delistingDate == 'undefined', isTrue);
      expect(testStockListing.status == 'undefined', isTrue);
    });

    test('오류 없는 형태의 json 데이터를 받았을 때 정확한 역직렬화가 가능한가?', () {
      // given
      final String testMessage =
          '''A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active''';
      final StockListing testStockListing = StockListing.fromCsv(testMessage);

      // when & then
      expect(testStockListing.symbol == 'A', isTrue);
      expect(testStockListing.name == 'Agilent Technologies Inc', isTrue);
      expect(testStockListing.exchange == 'NYSE', isTrue);
      expect(testStockListing.assetType == 'Stock', isTrue);
      expect(testStockListing.ipoDate == '1999-11-18', isTrue);
      expect(testStockListing.delistingDate == 'null', isTrue);
      expect(testStockListing.status == 'Active', isTrue);
    });

    test('객체를 json 데이터 형태로 정확한 직렬화가 가능한가?', () {
      // given
      // testMessage는 csv 파일에서 그대로 긁어와 공백만 없앤 문자열
      final String testMessage =
          '''A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active''';

      final String testSymbol = 'A';
      final String testName = 'Agilent Technologies Inc';
      final String testExchange = 'NYSE';
      final String testAssetType = 'Stock';
      final String testIpoDate = '1999-11-18';
      final String testDelistingDate = 'null';
      final String testStatus = 'Active';
      final StockListing testStockListing = StockListing(
        symbol: testSymbol,
        name: testName,
        exchange: testExchange,
        assetType: testAssetType,
        ipoDate: testIpoDate,
        delistingDate: testDelistingDate,
        status: testStatus,
      );

      final String encodedString = testStockListing.toCsv();

      // when & then
      expect(encodedString, equals(testMessage));
    });
  });
}

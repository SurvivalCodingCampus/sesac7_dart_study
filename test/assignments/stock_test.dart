import 'package:modu_3_dart_study/assignments/data_source/csv_data_source_exception.dart';
import 'package:modu_3_dart_study/assignments/data_source/stock_list_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  group('StockDataSourceImpl 클래스 테스트', () {
    final validDataSource = StockDataSourceImpl(
      csvPath: 'lib/assignments/data_source/data/listing_status.csv',
    );

    final invalidDataSource = StockDataSourceImpl(csvPath: 'invalid_data.csv');

    test('250개 이상 있는지 체크, 원본 첫번째 A 데이터 확인', () async {
      final listings = await validDataSource.getStockListings();
      final firstStock = listings.first;

      expect(listings.length, greaterThan(250));

      expect(firstStock.symbol, 'A');
      expect(firstStock.name, 'Agilent Technologies Inc');
      expect(firstStock.exchange, 'NYSE');
      expect(firstStock.assetType, 'Stock');
      expect(firstStock.ipoDate, '1999-11-18');
    });

    test('파일이 존재하지 않으면 DataSourceException', () {
      expect(
        () async => await invalidDataSource.getStockListings(),
        throwsA(isA<CsvDataSourceException>()),
      );
    });
  });
}

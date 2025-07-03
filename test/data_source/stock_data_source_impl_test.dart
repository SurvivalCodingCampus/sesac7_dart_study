import 'package:modu_3_dart_study/data_source/stock_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  group(
    'getStockListings',
    () {
      test(
        'If the csv file is healthy, the first value of getStockListings will be the same as the expected values.',
        () async {
          // given
          final expectedSymbol = "A";
          final expectedName = "Agilent Technologies Inc";
          final expectedExchange = "NYSE";
          final expectedAssetType = "Stock";
          final expectedIpoDate = "1999-11-18";
          final expectedDelistingDate = "null";
          final expectedStatus = "Active";

          // when
          final stockListings = await StockDataSourceImpl().getStockListings();
          final first = stockListings.first;

          // then
          expect(first.symbol, expectedSymbol);
          expect(first.name, expectedName);
          expect(first.exchange, expectedExchange);
          expect(first.assetType, expectedAssetType);
          expect(first.ipoDate, expectedIpoDate);
          expect(first.delistingDate, expectedDelistingDate);
          expect(first.status, expectedStatus);
        },
      );
    },
  );
}

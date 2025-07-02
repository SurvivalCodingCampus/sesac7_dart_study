
import 'package:modu_3_dart_study/20250702/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/20250702/stock_listing.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('', () {
    test('user list 데이터 가져오기', () async {
      StockDataSourceImpl stockDataSourceImpl = StockDataSourceImpl();
      final stockList = await stockDataSourceImpl.getStockListings('listing_status.csv');

      expect(stockList , isA<List<StockListing?>>());
      expect(stockList[0].name , 'Agilent Technologies Inc');
      expect(stockList[2].name , 'ALTERNATIVE ACCESS FIRST PRIORITY CLO BOND ETF ');
    });
  });
}
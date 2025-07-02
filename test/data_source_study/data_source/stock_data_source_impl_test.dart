import 'package:modu_3_dart_study/data_source_study/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/data_source_study/model/stock_listing.dart';
import 'package:test/test.dart';

void main() {
  test('읽어올 파일 경로를 잘못 입력할 시 예외 처리가 올바르게 작동하는가?', () {
    // given
    final String wrongStockPath = 'wrongPath/listing_status.csv';
    final StockDataSourceImpl testStockSource = StockDataSourceImpl();

    // when
    testStockSource.stockFilePath = wrongStockPath;

    // then
    expect(testStockSource.getStockListings(), throwsException);
  });

  test('정상적으로 파일을 읽어와 역직렬화 했을 때, name이 공백으로 설정된 필드가 포함되진 않았는가?', () async {
    // given
    // testStockListing1, testStockListing2, testStockListing3은 실제 csv 파일 내 존재하는 데이터이다.
    // testStockListing1은 name이 공백이 아닌 데이터, 나머지 둘은 공백 상태이다.
    final StockListing testStockListing1 = StockListing(
      symbol: 'A',
      name: 'Agilent Technologies Inc',
      exchange: 'NYSE',
      assetType: 'Stock',
      ipoDate: '1999-11-18',
      delistingDate: 'null',
      status: 'Active',
    );
    final StockListing testStockListing2 = StockListing(
      symbol: 'ZZZ',
      name: '',
      exchange: 'NYSE ARCA',
      assetType: 'Stock',
      ipoDate: '2020-07-22',
      delistingDate: 'null',
      status: 'Active',
    );
    final StockListing testStockListing3 = StockListing(
      symbol: 'ZTST',
      name: '',
      exchange: 'BATS',
      assetType: 'Stock',
      ipoDate: '2015-10-19',
      delistingDate: 'null',
      status: 'Active',
    );
    final StockDataSourceImpl testStockSource = StockDataSourceImpl();

    // stockList에는 name이 공백이 아닌 데이터만 모여있다.
    final List<StockListing> stockList = await testStockSource
        .getStockListings();

    // when & then
    expect(stockList.contains(testStockListing1), isTrue);
    expect(stockList.contains(testStockListing2), isFalse);
    expect(stockList.contains(testStockListing3), isFalse);
  });
}

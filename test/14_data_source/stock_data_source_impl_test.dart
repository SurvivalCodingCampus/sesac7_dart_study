import 'package:modu_3_dart_study/14_data_source/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/14_data_source/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/14_data_source/model/stock_listing.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StockDataSourceImpl 테스트', () {
    final csvString =
        'symbol,name,exchange,assetType,ipoDate,delistingDate,status\n'
                'A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active\n'
                'AA,Alcoa Corp,NYSE,Stock,2016-10-18,null,Active\n'
                'AAA,ALTERNATIVE ACCESS FIRST PRIORITY CLO BOND ETF ,NYSE ARCA,ETF,2020-09-09,null,Active\n'
                'AAAU,Goldman Sachs Physical Gold ETF,BATS,ETF,2018-08-15,null,Active\n'
                'AACBR,Artius II Acquisition Inc Rights,NASDAQ,Stock,2025-04-07,null,Active\n'
                'AACBU,Artius II Acquisition Inc - Units (1 Ord Shs & 1 Rts),NASDAQ,Stock,2025-02-13,null,Active\n'
                'AACG,ATA Creativity Global,NASDAQ,Stock,2008-01-29,null,Active\n'
                'AACI,Armada Acquisition Corp II - Class A,NASDAQ,Stock,2025-06-24,null,Active\n'
                'AACIU,Armada Acquisition Corp II - Units (1 Ord Cls A & 1/2 War),NASDAQ,Stock,2025-05-21,null,Active\n'
            .trim();
    final StockDataSource dataSource = StockDataSourceImpl();
    final testStockListings = csvString
        .split('\n')
        .map((e) => StockListing.fromCsv(e))
        .toList();

    test('getStockListings() 작동 테스트', () async {
      expect(
        (await dataSource.getStockListings()).sublist(0, 9),
        equals(testStockListings.skip(1)),
      );
    });

    test('getStockListings() 문제가 있는 항목 제외 테스트', () async {
      final allStockListCount = (await dataSource.getAllStockListings()).length;
      final stockListCount = (await dataSource.getStockListings()).length;

      expect(allStockListCount != stockListCount, isTrue);
    });
  });
}

import 'package:modu_3_dart_study/data_source/stockdatasourceimpl.dart';
import 'package:modu_3_dart_study/model/stocklisting.dart';
import 'package:test/test.dart';

void main() {
  test('주식 정보 데이터를 제공하는 데이터소스 Test', () async {
    //given(준비)
    final String name1 = 'Agilent Technologies Inc';
    final String name11854 = 'TEST TICKER FOR UTP';
    StockDataSourceImpl stockDataSourceImpl = StockDataSourceImpl();

    //when(실행)
    try {
      List<StockListing> stocklisting = await stockDataSourceImpl.getStockListings();

      //then(검증)
      expect(stocklisting[0].name, name1);
      expect(stocklisting[stocklisting.length-1].name, name11854);
      expect(stocklisting.length, 11855);

    } catch (e) {
      print(e);
    }
  });
}



import 'package:test/test.dart';
import 'package:modu_3_dart_study/listing_status.dart';

void main() async {

  final stocklistingImpl = StockListingImpl('lib/assets/listing_status.csv');
  final stockslist = await stocklistingImpl.getStockListings();

  test('csv 값을 변환된 StockListing 객체로 생성할 수 있다', (){
    final stockTest = stockslist[0];
    expect(stockTest.symbol, equals('A'));
  });

  test('name 값 중 빈값이 있는 값은 없다', (){
    final hasEmptyName = stockslist.any((item) => item.name.isEmpty);
    expect(hasEmptyName, isFalse);
  });
}
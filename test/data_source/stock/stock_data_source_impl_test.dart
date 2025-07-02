import 'dart:io';

import 'package:modu_3_dart_study/data_source/stock/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/model/stock_listing.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StockDataSourceImplTest', () {
    test('getStockListings 메서드 return 값 list empty', () async {
      final StockDataSourceImpl stockDataSourceImpl = StockDataSourceImpl();
      final List<StockListing> stockList = await stockDataSourceImpl.getStockListings();

      expect(stockList.isNotEmpty, isTrue);
    });

    test('getStockListings 메서드 return 값 list 요소 객체 검증', () async {
      final File csvFile = File('json_data/listing_status.csv');
      final List<String> csvStringList = await csvFile.readAsLines()..removeAt(0);
      final StockListing csvGetTodo = StockListing.fromCsv(csvStringList[0]);

      final StockDataSourceImpl stockDataSourceImpl = StockDataSourceImpl();
      final List<StockListing> stockList = await stockDataSourceImpl.getStockListings();
      final implGetStock = stockList.first;

      expect(csvGetTodo.symbol, equals(implGetStock.symbol));
      expect(csvGetTodo.name, equals(implGetStock.name));
      expect(csvGetTodo.exchange, equals(implGetStock.exchange));
      expect(csvGetTodo.assetType, equals(implGetStock.assetType));
      expect(csvGetTodo.ipoDate, equals(implGetStock.ipoDate));
      expect(csvGetTodo.delistingDate, equals(implGetStock.delistingDate));
      expect(csvGetTodo.status, equals(implGetStock.status));
    });
  });
}
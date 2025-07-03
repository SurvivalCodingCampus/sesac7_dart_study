import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-07-02/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-02/models/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    await Future.delayed(Duration(seconds: 1));
    final file = File('lib/assignments/2025-07-02/listing_status.csv');
    final dataList = file.readAsLinesSync();
    print(dataList.length);
    return dataList
        .skip(1)
        .map((e) => StockListing.fromCsv(e))
        .where((e) => e.name != '')
        .toList();
  }
}

void main() async {
  List<StockListing> stockListings = await StockDataSourceImpl()
      .getStockListings();
  print(stockListings.length);
  print(stockListings[0].name);
}

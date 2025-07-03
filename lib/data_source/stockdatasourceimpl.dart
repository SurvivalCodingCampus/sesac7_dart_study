import 'dart:io';

import 'package:modu_3_dart_study/data_source/stockdatasource.dart';

import '../model/stocklisting.dart';

const String filePath =
    //'C:/Users/caforestle/dev/dart_study/sesac7_dart_study/lib/csv/listing_status.csv';
    '/Users/mymac/flutter_study/sesac7_dart_study/lib/csv/listing_status.csv';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    final file = File(filePath);
    // String csvString = file.readAsStringSync();
    List<String> line = file.readAsLinesSync();
    List<StockListing> stockList = [];

    for (int i = 1; i < line.length; i++) {
      StockListing resultCsv = StockListing.fromCsv(line[i]);
      if (resultCsv.name == '') continue;
      stockList.add(resultCsv);
    }
    return stockList;
  }
}
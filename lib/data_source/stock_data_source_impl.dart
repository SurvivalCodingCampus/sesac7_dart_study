import 'dart:io';

import 'package:modu_3_dart_study/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  static const _csvLabelName = 'name';

  @override
  Future<List<StockListing>> getStockListings() async {
    final file = File('assets/listing_status.csv');
    final csvString = await file.readAsString();
    return csvString
        .trim()
        .split('\n')
        .map((e) => e.replaceAll('\r', ''))
        .map(StockListing.fromCsv)
        .where((e) => e.name != null && e.name != '' && e.name != _csvLabelName)
        .toList();
  }
}

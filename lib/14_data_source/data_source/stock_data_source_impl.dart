import 'dart:io';

import 'package:modu_3_dart_study/14_data_source/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/14_data_source/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    final List<StockListing> stockListing =
        File(
              'listing_status.csv',
            )
            .readAsLinesSync()
            .map((e) => StockListing.fromCsv(e))
            .where((e) => (e.name as String).isNotEmpty)
            .toList();

    return stockListing;
  }

  @override
  Future<List<StockListing>> getAllStockListings() async {
    final List<StockListing> stockListing = File(
      'listing_status.csv',
    ).readAsLinesSync().map((e) => StockListing.fromCsv(e)).toList();

    return stockListing;
  }
}

void main() async {
  final dataSource = StockDataSourceImpl();

  print((await dataSource.getStockListings()).length);
}

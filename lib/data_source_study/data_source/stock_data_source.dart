import 'package:modu_3_dart_study/data_source_study/model/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

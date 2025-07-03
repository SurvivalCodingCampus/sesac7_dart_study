import 'package:modu_3_dart_study/250702/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

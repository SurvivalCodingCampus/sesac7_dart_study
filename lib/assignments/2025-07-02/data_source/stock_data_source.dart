import '../models/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

import '../model/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();

  Future<List<StockListing>> getAllStockListings();
}

import '../model/stocklisting.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}
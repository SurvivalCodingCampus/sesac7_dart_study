abstract interface class StockDataSource {
  Future<StockListing> getStockListing();

  Future<List<StockListing>> getStockListings();
}

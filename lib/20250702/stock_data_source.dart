import 'package:modu_3_dart_study/20250702/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing?>> getStockListings(String cvsPath);
}
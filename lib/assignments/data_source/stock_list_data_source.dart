import 'package:modu_3_dart_study/assignments/data_source/stock_list_model.dart';

abstract interface class StockListDataSource {
  Future<List<StockListModel>> getStockListings();
}

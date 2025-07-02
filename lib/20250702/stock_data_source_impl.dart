import 'dart:io';

import 'package:modu_3_dart_study/20250702/stock_data_source.dart';
import 'package:modu_3_dart_study/20250702/stock_listing.dart';

import '../20250625/my_exception.dart';

class StockDataSourceImpl implements StockDataSource {
  
  @override
  Future<List<StockListing>> getStockListings(String csvPath) async {
    final sourceFile = File(csvPath);

    if (!await sourceFile.exists()) {
      throw MyException(MyException.FILE_NOT_FOUND);
    }

    final stockList = await sourceFile.readAsLines();

    if (stockList.length <= 1) return [];

    return stockList
        .skip(1) // 헤더 제거
        .map((line) => line.split(','))
        .map((fields) => StockListing.fromCvs(fields))
        .where((stock) => stock.name?.isNotEmpty == true)
        .toList();
  }
}
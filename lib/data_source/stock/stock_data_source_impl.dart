import 'dart:io';

import 'package:modu_3_dart_study/data_source/stock/stock_data_source.dart';
import 'package:modu_3_dart_study/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    final File csvFile = File('json_data/listing_status.csv');
    if (!await csvFile.exists()) {
      throw Exception('listing_status csv 파일이 없습니다.');
    }

    final List<String> csvStringList = await csvFile.readAsLines()
      ..removeAt(0); // 첫 번째 줄 제거
    if (csvStringList.isEmpty) {
      throw Exception('listing_status csv 파일이 비어있습니다.');
    }
    return csvStringList
        .map((csvRow) => StockListing.fromCsv(csvRow))
        .where((stockListing) => stockListing.name?.isNotEmpty == true)
        .toList();
  }
}

void main() async {
  print(await StockDataSourceImpl().getStockListings());
}

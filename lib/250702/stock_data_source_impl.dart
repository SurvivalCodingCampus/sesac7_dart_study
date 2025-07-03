import 'dart:io';

import 'package:modu_3_dart_study/250702/stock_data_source.dart';
import 'package:modu_3_dart_study/250702/stock_listing.dart';

enum FieldName {
  symbol,
  name,
  exchange,
  assetType,
  ipoDate,
  delistingDate,
  status,
}

class StockDataSourceImpl implements StockDataSource {
  static const columnCount = 7;
  final String _filePath = 'asset/listing_status.csv';
  final List<StockListing> _stockListingList = [];

  @override
  Future<List<StockListing>> getStockListings() async {
    await decodeCsv(_filePath);
    return _stockListingList;
  }

  //csv파일의 패스를 받고, StockListing의 List를 반환
  Future<void> decodeCsv(String filePath) async {
    final file = File(filePath);
    final csv = file.readAsStringSync();

    List<String> csvRows = csv.split('\n');
    print('csvRows.length: ${csvRows.length}');

    //첫행은 필드이름, 스킵한다.
    _stockListingList.clear();
    for (int i = 1; i < csvRows.length; i++) {
      final csvColumns = csvRows[i].split(',');

      if (csvColumns.length == columnCount &&
          csvColumns[FieldName.name.index].isNotEmpty &&
          csvColumns[FieldName.ipoDate.index] != 'null') {
        _stockListingList.add(StockListing.fromCsv(csvRows[i]));
      } else {
        print(csvColumns);
      }
    }

    print('_stockListingList.length: ${_stockListingList.length}');
  }
}

void main() async {
  final stockDataSourceImpl = StockDataSourceImpl();
  final list = await stockDataSourceImpl.getStockListings();

  print(list[0]);
  print(list[list.length - 2]);
}

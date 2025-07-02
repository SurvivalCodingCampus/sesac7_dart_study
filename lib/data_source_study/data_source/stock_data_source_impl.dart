import 'dart:io';

import 'package:modu_3_dart_study/data_source_study/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/data_source_study/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    try {
      final List<dynamic> csv =
          File('lib/data_source_study/listing_status.csv').readAsLinesSync()
              as List<dynamic>;
      final List<StockListing> result = csv
          .where((e) => e.split(',')[1].isNotEmpty)
          .map((e) => StockListing.fromCsv(e))
          .toList();
      return result;
    } on FileSystemException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('예상치 못한 오류');
    }
  }
}

void main() async {
  StockDataSourceImpl st = StockDataSourceImpl();
  List<StockListing> l = await st.getStockListings();
  print(l.toString());
  print(
    l.contains(
      StockListing(
        symbol: 'A',
        name: 'Agilent Technologies Inc',
        exchange: 'NYSE',
        assetType: 'Stock',
        ipoDate: '1999-11-18',
        delistingDate: 'null',
        status: 'Active',
      ),
    ),
  );

  File f = File('lib/data_source_study/test2.csv');
  StringBuffer s = StringBuffer();
  s.write(l);

  f.writeAsStringSync(s.toString());
}

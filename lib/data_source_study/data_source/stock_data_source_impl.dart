import 'dart:io';

import 'package:modu_3_dart_study/data_source_study/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/data_source_study/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  String _stockFilePath = 'lib/data_source_study/listing_status.csv';

  // getter
  String get stockFilePath => _stockFilePath;

  // setter
  set stockFilePath(String stockFilePath) {
    if (stockFilePath.isEmpty) {
      throw Exception('파일 경로를 입력해야 합니다.');
    }
    _stockFilePath = stockFilePath;
  }

  @override
  Future<List<StockListing>> getStockListings() async {
    try {
      // csv 파일을 줄 단위로 읽어서 리스트에 담는다
      final List<dynamic> csv =
          File(stockFilePath).readAsLinesSync() as List<dynamic>;

      final List<StockListing> result = csv
          .where((e) => e.split(',')[1].isNotEmpty) // name이 공백이 아닌 것만 취합
          .map((e) => StockListing.fromCsv(e)) // StockListing 객체로 역직렬화
          .toList(); // 결과를 리스트에 담는다
      return result;
    } on FileSystemException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('예상치 못한 오류');
    }
  }
}

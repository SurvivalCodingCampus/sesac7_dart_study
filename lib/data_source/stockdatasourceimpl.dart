import 'dart:io';

import 'package:modu_3_dart_study/data_source/stockdatasource.dart';

import '../model/stocklisting.dart';

const String filePath =
    'C:/Users/caforestle/dev/dart_study/sesac7_dart_study/lib/csv/listing_status.csv';


class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    final file = File(filePath);
    String csvString = file.readAsStringSync();
    return [];
  }
}

void main(){
  final file = File(filePath);
  String csvString = file.readAsStringSync();
  final lines = csvString.split('\n');
  print(lines);

  final result = <List<String>>[];
  for (final line in lines) {
    if (line.trim().isNotEmpty) { // 빈 줄 건너뛰기
      final row = line.split(',');
      result.add(row);
    }
  }
  print(result);
}

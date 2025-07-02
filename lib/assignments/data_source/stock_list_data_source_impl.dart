import 'package:modu_3_dart_study/assignments/data_source/csv_data_source_exception.dart';
import 'package:modu_3_dart_study/assignments/data_source/stock_list_data_source.dart';
import 'package:modu_3_dart_study/assignments/data_source/stock_list_model.dart';

class StockDataSourceImpl implements StockListDataSource {
  final String _csvPath;

  StockDataSourceImpl({required String csvPath}) : _csvPath = csvPath;

  @override
  Future<List<StockListModel>> getStockListings() async {
    final csvString = await getCsvFile(_csvPath);

    final lines = csvString.split('\n');

    return lines
        .skip(1)
        .map((line) {
          try {
            return StockListModel.fromCsv(line);
          } catch (e) {
            return null;
          }
        })
        .where((stock) => stock != null)
        .cast<StockListModel>()
        .toList();
  }
}

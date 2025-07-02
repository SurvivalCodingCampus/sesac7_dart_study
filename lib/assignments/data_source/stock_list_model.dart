class StockListModel {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  final String delistingDate;
  final String status;

  StockListModel({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory StockListModel.fromCsv(String csvData) {
    final values = csvData.split(',');

    if (values.length != 7) {
      throw FormatException('CSV 행의 열 개수가 7개가 아닙니다 : $csvData');
    }

    final name = values[1];
    if (name.isEmpty) {
      throw FormatException('이름이 없습니다 : $csvData');
    }

    return StockListModel(
      symbol: values[0],
      name: values[1],
      exchange: values[2],
      assetType: values[3],
      ipoDate: values[4],
      delistingDate: values[5],
      status: values[6],
    );
  }
}

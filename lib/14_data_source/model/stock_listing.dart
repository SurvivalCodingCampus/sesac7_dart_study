class StockListing {
  final String? symbol;
  final String? name;
  final String? exchange;
  final String? assetType;
  final String? ipoDate;
  final String? delistingDate;
  final String? status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory StockListing.fromCsv(String csvRow) {
    final List<String> data = csvRow.split(',');
    if (data.length > 8) {
      throw Exception();
    }
    return StockListing(
      symbol: data[0],
      name: data[1],
      exchange: data[2],
      assetType: data[3],
      ipoDate: data[4],
      delistingDate: data[5],
      status: data[6],
    );
  }

  String toCsv() {
    return '$symbol,$name,$exchange,$assetType,$ipoDate,$delistingDate,$status';
  }

  @override
  bool operator ==(Object other) {
    if (other is StockListing) {
      return symbol == other.symbol &&
          name == other.name &&
          exchange == other.exchange &&
          assetType == other.assetType &&
          ipoDate == other.ipoDate &&
          delistingDate == other.delistingDate &&
          status == other.status;
    }
    return false;
  }

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      exchange.hashCode ^
      assetType.hashCode ^
      ipoDate.hashCode ^
      delistingDate.hashCode ^
      status.hashCode;

  @override
  String toString() {
    return '[$symbol,$name,$exchange,$assetType,$ipoDate,$delistingDate,$status]';
  }
}

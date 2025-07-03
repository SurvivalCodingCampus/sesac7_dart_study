class StockListing {
  final String? symbol;
  final String? name;
  final String? exchange;
  final String? assetType;
  final String? ipoDate;
  final String? delistingDate;
  final String? status;

  StockListing({
    this.symbol,
    this.name,
    this.exchange,
    this.assetType,
    this.ipoDate,
    this.delistingDate,
    this.status,
  });

  factory StockListing.fromCsv(String csvRow) {
    final List<String> csvList = csvRow.split(',');
    if (csvList.length != 7) {
      throw Exception('index Error!!');
    }
    return StockListing(
      symbol: csvList[0],
      name: csvList[1],
      exchange: csvList[2],
      assetType: csvList[3],
      ipoDate: csvList[4],
      delistingDate: csvList[5],
      status: csvList[6],
    );
  }

  @override
  String toString() =>
      'StockListing(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status)';

  @override
  int get hashCode => Object.hash(
    symbol,
    name,
    exchange,
    assetType,
    ipoDate,
    delistingDate,
    status,
  );

  @override
  bool operator ==(Object other) => other is StockListing
      ? symbol == other.symbol &&
            name == other.name &&
            exchange == other.exchange &&
            assetType == other.assetType &&
            ipoDate == other.ipoDate &&
            delistingDate == other.delistingDate &&
            status == other.status
      : false;

  StockListing copyWith({
    String? symbol,
    String? name,
    String? exchange,
    String? assetType,
    String? ipoDate,
    String? delistingDate,
    String? status,
  }) => StockListing(
    symbol: symbol ?? this.symbol,
    name: name ?? this.name,
    exchange: exchange ?? this.exchange,
    assetType: assetType ?? this.assetType,
    ipoDate: ipoDate ?? this.ipoDate,
    delistingDate: delistingDate ?? this.delistingDate,
    status: status ?? this.status,
  );

  String toCsv() =>
      '$symbol,$name,$exchange,$assetType,$ipoDate,$delistingDate,$status';
}

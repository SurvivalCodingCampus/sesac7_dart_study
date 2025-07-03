class StockListing {
  final String? symbol;
  final String? name;
  final String? exchange;
  final String? assetType;
  final String? ipoDate;
  final String? delistingDate;
  final String? status;

  StockListing(
    this.symbol,
    this.name,
    this.exchange,
    this.assetType,
    this.ipoDate,
    this.delistingDate,
    this.status,
  );

  StockListing copyWith({
    String? symbol,
    String? name,
    String? exchange,
    String? assetType,
    String? ipoDate,
    String? delistingDate,
    String? status,
  }) {
    return StockListing(
      symbol ?? this.symbol,
      name ?? this.name,
      exchange ?? this.exchange,
      assetType ?? this.assetType,
      ipoDate ?? this.ipoDate,
      delistingDate ?? this.delistingDate,
      status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'exchange': exchange,
      'assetType': assetType,
      'ipoDate': ipoDate,
      'delistingDate': delistingDate,
      'status': status,
    };
  }

  factory StockListing.fromJson(Map<String, dynamic> map) {
    return StockListing(
      map['symbol'] ?? '',
      map['name'] ?? '',
      map['exchange'] ?? '',
      map['assetType'] ?? '',
      map['ipoDate'] ?? '',
      map['delistingDate'] ?? '',
      map['status'] ?? '',
    );
  }

  factory StockListing.fromCsv(List<String> list) {
    if(list.length != 7) throw Exception('잘못된 데이터 입니다.');

    return StockListing(
      list[0],
      list[1],
      list[2],
      list[3],
      list[4],
      list[5],
      list[6],
    );
  }

  @override
  String toString() {
    return 'StockListing{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status,}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockListing &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          name == other.name &&
          exchange == other.exchange &&
          assetType == other.assetType &&
          ipoDate == other.ipoDate &&
          delistingDate == other.delistingDate &&
          status == other.status;

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      exchange.hashCode ^
      assetType.hashCode ^
      ipoDate.hashCode ^
      delistingDate.hashCode ^
      status.hashCode;
}

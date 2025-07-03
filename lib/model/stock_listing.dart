import 'package:modu_3_dart_study/extension/list.dart';

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
    if (csvRow.isEmpty) {
      return StockListing(
        symbol: null,
        name: null,
        exchange: null,
        assetType: null,
        ipoDate: null,
        delistingDate: null,
        status: null,
      );
    }

    final items = csvRow.split(',');
    return StockListing(
      symbol: items.tryGet(0),
      name: items.tryGet(1),
      exchange: items.tryGet(2),
      assetType: items.tryGet(3),
      ipoDate: items.tryGet(4),
      delistingDate: items.tryGet(5),
      status: items.tryGet(6),
    );
  }

  String toCsv() {
    return [
      symbol,
      name,
      exchange,
      assetType,
      ipoDate,
      delistingDate,
      status,
    ].join(',');
  }

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
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      assetType: assetType ?? this.assetType,
      ipoDate: ipoDate ?? this.ipoDate,
      delistingDate: delistingDate ?? this.delistingDate,
      status: status ?? this.status,
    );
  }

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is StockListing &&
            symbol == other.symbol &&
            name == other.name &&
            exchange == other.exchange &&
            assetType == other.assetType &&
            ipoDate == other.ipoDate &&
            delistingDate == other.delistingDate &&
            status == other.status;
  }
}

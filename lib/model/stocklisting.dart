class StockListing {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  final String delistingDate;
  final String status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

/*
  factory StockListing.fromCsv(String csvRow){
    return StockListing(
      symbol: symbol,
      name: name,
      exchange: exchange,
      assetType: assetType,
      ipoDate: ipoDate,
      delistingDate: delistingDate,
      status: status,)
  }
*/
}
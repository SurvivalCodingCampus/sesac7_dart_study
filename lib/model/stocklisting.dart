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

  factory StockListing.fromCsv(String csv){
    List<String> val = csv.split(',');
    return StockListing(
        symbol: val[0],
        name: val[1],
        exchange: val[2],
        assetType: val[3],
        ipoDate: val[4],
        delistingDate: val[5],
        status: val[6]);
  }
}
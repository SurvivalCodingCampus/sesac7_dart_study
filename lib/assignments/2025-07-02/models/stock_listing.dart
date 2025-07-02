class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String delistingDate;
  String status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  // factory StockListing.fromCsv(String csvRow) {
  //   final propertiesList = csvRow.split(',');
  //   if (propertiesList[1] != 'name' && propertiesList[1] != '') {
  //     return StockListing(
  //       symbol: propertiesList[0],
  //       name: propertiesList[1],
  //       exchange: propertiesList[2],
  //       assetType: propertiesList[3],
  //       ipoDate: propertiesList[4],
  //       delistingDate: propertiesList[5],
  //       status: propertiesList[6],
  //     );
  //   }
  // }

  factory StockListing.fromCsv(String csvRow) {
    final propertiesList = csvRow.split(',');
    return StockListing(
      symbol: propertiesList[0],
      name: propertiesList[1],
      exchange: propertiesList[2],
      assetType: propertiesList[3],
      ipoDate: propertiesList[4],
      delistingDate: propertiesList[5],
      status: propertiesList[6],
    );
  }
}

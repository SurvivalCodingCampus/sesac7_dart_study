import 'dart:io';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

class StockListingImpl implements StockDataSource{
  @override
  Future<List<StockListing>> getStockListings() async {
    final file = await File('lib/assets/listing_status.csv').readAsLines();
    final lines = file.skip(1);
    
    // 첫번째 값 무시하기
    // removeAt(0)
    // file.sublist(1): 첫번째 요소를 제외한 

    final List<StockListing> listings = lines.map((file) => StockListing.fromCsv(file))
    .where((file) => file.name != '')
    .toList();
    return listings;
  }
}

class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String delistingDate;
  String status;

  StockListing({required this.symbol, required this.name, required this.exchange, required this.assetType, required this.ipoDate, required this.delistingDate, required this.status});

  factory StockListing.fromCsv(String csvRow){
    final value = csvRow.split(',');

    return StockListing(symbol: value[0], 
      name: value[1], 
      exchange: value[2], 
      assetType: value[3], 
      ipoDate: value[4], 
      delistingDate: value[5], 
      status: value[6]);
  }
}

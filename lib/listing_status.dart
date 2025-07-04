import 'dart:io';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

class StockListingImpl implements StockDataSource {
  // 파일을 가져오기만 하는 생성자를 따로 만들어서 관리
  // 테스트 파일을 넣거나 실제 주소를 넣거나 하는 방식으로 활용
  final String filePath;
  StockListingImpl(this.filePath); // 외부에서 파일경로를 넣을 수 있음

  @override
  Future<List<StockListing>> getStockListings() async {
    final file = await File(filePath).readAsLines();
    final lines = file.skip(1);

    // 파일을 읽는 방법을 readAsLineSync 사용할 경우 '동기'라서 다른 일을 할 수 없어짐

    // 첫번째 값 무시하기
    // removeAt(0)
    // file.sublist(1): 첫번째 요소를 제외한

    final List<StockListing> listings = lines
        .map((csvRow) => StockListing.fromCsv(csvRow))
        // stocklisting 으로 바꾸기 실제로 들어가는 값에 따라 적기
        // .where((listing) => listing.name != '')
        .where((listing) => listing.name.isNotEmpty)
        .toList();
    return listings;
  }

  // 생성자로 따로 지정하는게 좋을것 같다 파일을 가져오기만 하는 생성자
  // StockListing 만 있는 인터페이스 만들어서 테스트 코드를 적용하거나 실제 주소를 넣거나 하면서 개발한다
  // 실제 주소는 생성자로 해결한다
}

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

  factory StockListing.fromCsv(String csvRow) {
    final value = csvRow.split(',');

    return StockListing(
      symbol: value[0],
      name: value[1],
      exchange: value[2],
      assetType: value[3],
      ipoDate: value[4],
      delistingDate: value[5],
      status: value[6],
    );
  }
}

// toCsv [].join

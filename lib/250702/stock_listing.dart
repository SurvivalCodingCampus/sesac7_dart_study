//symbol,name,exchange,assetType,ipoDate,delistingDate,status
//A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active

class StockListing {
  String _symbol;
  String _name;
  String _exchange;
  String _assetType;
  DateTime _ipoDate;
  DateTime? _delistingDate;
  String _status;

  StockListing._internal(
    this._symbol,
    this._name,
    this._exchange,
    this._assetType,
    this._ipoDate,
    this._delistingDate,
    this._status,
  );

  factory StockListing.fromCsv(String csvRow) {
    final columns = csvRow.split(',');

    //데이터가공(넘어온 값을 보고 적절한 값)
    String symbol = columns[0];
    String name = columns[1];
    String exchange = columns[2];
    String assetType = columns[3];
    DateTime ipoDate = DateTime.parse(columns[4]);

    DateTime? delistingDate;
    if (columns[5] == 'null') {
      delistingDate = null;
    } else {
      delistingDate = DateTime.parse(columns[5]);
    }
    String status = columns[6];

    //객체만들기
    return StockListing._internal(
      symbol,
      name,
      exchange,
      assetType,
      ipoDate,
      delistingDate,
      status,
    );
  }

  @override
  String toString() {
    return '$_symbol, $_name, $_exchange, $_assetType, $_ipoDate, $_delistingDate, $_status';
  }
}

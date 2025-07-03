class StockListing {
  String _symbol;
  String _name;
  String _exchange;
  String _assetType;
  String _ipoDate;
  String? _delistingDate;
  String _status;

  // 생성자
  StockListing({
    required String symbol,
    required String name,
    required String exchange,
    required String assetType,
    required String ipoDate,
    required String? delistingDate,
    required String status,
  }) : _symbol = symbol.isEmpty ? 'undefined' : symbol,
       _name = name.isEmpty ? 'undefined' : name,
       _exchange = exchange.isEmpty ? 'undefined' : exchange,
       _assetType = assetType.isEmpty ? 'undefined' : assetType,
       _ipoDate = ipoDate.isEmpty ? 'undefined' : ipoDate,
       _delistingDate = delistingDate != null
           ? (delistingDate.isEmpty ? 'undefined' : delistingDate)
           : 'undefined',
       _status = status.isEmpty ? 'undefined' : status;

  // getter
  String get symbol => _symbol;

  String get name => _name;

  String get exchange => _exchange;

  String get assetType => _assetType;

  String get ipoDate => _ipoDate;

  String? get delistingDate => _delistingDate;

  String get status => _status;

  // setter
  set symbol(String symbol) {
    if (symbol.isEmpty) {
      throw Exception('주식 심볼을 입력해야 합니다.');
    }
    _symbol = symbol;
  }

  set name(String name) {
    if (name.isEmpty) {
      throw Exception('주식 이름을 입력해야 합니다.');
    }
    _name = name;
  }

  set exchange(String exchange) {
    if (exchange.isEmpty) {
      throw Exception('상장 위치를 입력해야 합니다.');
    }
    _exchange = exchange;
  }

  set assetType(String assetType) {
    if (assetType.isEmpty) {
      throw Exception('자산 형태를 입력해야 합니다.');
    }
    _assetType = assetType;
  }

  set ipoDate(String ipoDate) {
    if (ipoDate.isEmpty) {
      throw Exception('상장일을 입력해야 합니다.');
    }
    _ipoDate = ipoDate;
  }

  set delistingDate(String? delistingDate) {
    if (delistingDate != null && delistingDate.isEmpty) {
      throw Exception('상장일을 입력해야 합니다.');
    }
    _delistingDate = delistingDate;
  }

  set status(String status) {
    if (status.isEmpty) {
      throw Exception('상태를 입력해야 합니다.');
    }
    _status = status;
  }

  // 역직렬화(factory)
  factory StockListing.fromCsv(String csvRow) {
    final List<String> csvRowList = csvRow.split(',');

    return StockListing(
      symbol: csvRowList[0],
      name: csvRowList[1],
      exchange: csvRowList[2],
      assetType: csvRowList[3],
      ipoDate: csvRowList[4],
      delistingDate: csvRowList[5],
      status: csvRowList[6],
    );
  }

  // 직렬화
  // json 형식이 아닌 csv로의 직렬화이므로, 콤마를 이용한 형태로 직렬화한다.
  String toCsv() {
    return '$symbol,$name,$exchange,$assetType,$ipoDate,$delistingDate,$status';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockListing &&
          runtimeType == other.runtimeType &&
          _symbol == other._symbol &&
          _name == other._name &&
          _exchange == other._exchange &&
          _assetType == other._assetType &&
          _ipoDate == other._ipoDate &&
          _delistingDate == other._delistingDate &&
          _status == other._status;

  @override
  int get hashCode =>
      _symbol.hashCode ^
      _name.hashCode ^
      _exchange.hashCode ^
      _assetType.hashCode ^
      _ipoDate.hashCode ^
      _delistingDate.hashCode ^
      _status.hashCode;

  @override
  String toString() {
    return 'symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status\n\n';
  }
}

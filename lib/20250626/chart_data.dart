class CollectionSalePrice {
  final double _price;
  final String _cvtDatetime;

  double get price => _price;
  String get cvtDatetime => _cvtDatetime;

  CollectionSalePrice(double price, String cvtDatetime): _price = price, _cvtDatetime = cvtDatetime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CollectionSalePrice &&
              runtimeType == other.runtimeType &&
              _price == other._price &&
              _cvtDatetime == other._cvtDatetime;

  @override
  int get hashCode => _price.hashCode ^ _cvtDatetime.hashCode;

  CollectionSalePrice copyWith({
    double? price,
    String? cvtDatetime,
  }) {
    return CollectionSalePrice(
      price ?? _price,
      cvtDatetime ?? _cvtDatetime,
    );
  }
}

class CollectionChartData {
  final List<CollectionSalePrice> _collectionSalePrices;
  final String _collectionName;

  CollectionChartData(List<CollectionSalePrice> collectionSalePrices, String collectionName)
    :_collectionSalePrices = collectionSalePrices, _collectionName = collectionName;

  String get collectionName => _collectionName;
  List<CollectionSalePrice> get collectionSalePrices => _collectionSalePrices;

  CollectionChartData copyWith({
    List<CollectionSalePrice>? collectionSalePrices,
    String? collectionName,
  }) {
    return CollectionChartData(
      collectionSalePrices ?? _collectionSalePrices,
      collectionName ?? _collectionName,
    );
  }
}
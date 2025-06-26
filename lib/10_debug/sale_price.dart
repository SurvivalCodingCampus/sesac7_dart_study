class SalePrice {
  final double _price;
  final DateTime _cvtDatetime;

  double get price => _price;

  DateTime get cvtDatetime => _cvtDatetime;

  SalePrice({
    required double price,
    required cvtDateTime,
  }) : _price = price,
       _cvtDatetime = cvtDateTime;

  SalePrice.fromJson(Map<String, dynamic> json)
    : _price = json['price'],
      _cvtDatetime = DateTime.parse(json['cvtDatetime']);

  @override
  bool operator ==(Object other) {
    return other is SalePrice
        ? price == other.price &&
              cvtDatetime.isAtSameMomentAs(other.cvtDatetime)
        : false;
  }

  @override
  int get hashCode => _price.hashCode ^ _cvtDatetime.hashCode;

  @override
  String toString() => 'SalePrice(price: $price, cvtDatetime: $cvtDatetime)';

  Map<String, dynamic> toJson() => {
    'price': _price,
    'cvtDatetime': _cvtDatetime.toString(),
  };
}

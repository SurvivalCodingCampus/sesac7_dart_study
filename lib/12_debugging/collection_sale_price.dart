class CollectionSalePrice {
  final num? price;
  final String? cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = (json['price'] ?? 0) as num,
      cvtDatetime = (json['cvtDatetime'] ?? '') as String;

  Map<String, dynamic> toJson() => {
    'price': price,
    'cvtDatetime': cvtDatetime,
  };

  @override
  bool operator ==(Object other) {
    if (other is CollectionSalePrice) {
      return price == other.price && cvtDatetime == other.cvtDatetime;
    }
    return false;
  }

  @override
  int get hashCode => price.hashCode ^ cvtDatetime.hashCode;

  @override
  String toString() {
    return '{"price": $price, "cvtDatetime": $cvtDatetime}';
  }
}

class CollectionSalePrice {
  final double price;
  final String cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = (json['price'] as num).toDouble(),
      cvtDatetime = json['cvtDatetime'];

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
    return '"price": $price, "cvtDatetime": $cvtDatetime';
  }
}

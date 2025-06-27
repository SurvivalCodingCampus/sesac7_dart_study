class CollectionSalePrice {
  static const String priceString = 'price';
  static const String cvtDatetimeString = 'cvtDatetime';

  final double? price;
  final DateTime? cvtDatetime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json[priceString],
      cvtDatetime = json[cvtDatetimeString] == null
          ? null
          : DateTime.parse(json[cvtDatetimeString]);

  Map<String, dynamic> toJson() {
    return {
      priceString: price,
      cvtDatetimeString: cvtDatetime,
    };
  }

  @override
  int get hashCode => Object.hash(price, cvtDatetime);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionSalePrice &&
          price == other.price &&
          cvtDatetime == other.cvtDatetime;

  @override
  String toString() {
    return 'CollectionSalePrice{$priceString: $price, $cvtDatetimeString: $cvtDatetime}\n';
  }
}

class CollectionSalePrice {
  //collectionSalePrice 01.class_instance
  final double price; // "price": 58.25
  final String? cvtDataTime; //"2023-03-26T08:00:00"

  // 생성자
  CollectionSalePrice({required this.price, this.cvtDataTime});

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDataTime = json['cvtDatetime'] ;
}

class CollectionChartData {
  final String collectionName;
  final List<CollectionSalePrice>? collectionSalePrice; // collection68 => null 허용

  CollectionChartData({
    required this.collectionName,
    this.collectionSalePrice,
  });

  // 라스트인지 확인
  CollectionChartData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice = (json['collectionSalePrice'] is List)
            ? (json['collectionSalePrice'] as List)
            .map((e) => CollectionSalePrice.fromJson(e))
            .toList()
            : null;
}

class ChartData{
  final List<CollectionChartData> collectionChartDataList;

  ChartData({required this.collectionChartDataList});

  ChartData.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List)
      .map((e) => CollectionChartData.fromJson(e))
      .toList();
}


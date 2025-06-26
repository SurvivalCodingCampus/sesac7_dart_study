//파일에서 json 데이터를 읽어서 처리해야 한다. 이 데이터를 담을 수 있는 클래스를 작성하시오.
import 'dart:convert';
import 'dart:io';

class CollectionSalePrice {
  final double price;
  final DateTime cvtDatetime;

  CollectionSalePrice(this.price, this.cvtDatetime);

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
    : price = json['price'],
      cvtDatetime = json['cvtDatetime'];

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatatime': cvtDatetime,
    };
  }

  CollectionSalePrice copyWith({double? price, DateTime? cvtDatetime}) {
    return CollectionSalePrice(
      price ?? this.price,
      cvtDatetime ?? this.cvtDatetime,
    );
  }
}

class CollectionChartDataList {
  String collectionName;
  CollectionSalePrice collectionSalePrice;

  CollectionChartDataList(this.collectionName, this.collectionSalePrice);

  CollectionChartDataList.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'],
      collectionSalePrice = CollectionSalePrice.fromJson(
        json['collectionSalePrice'],
      );

  Map<String, dynamic> toJson() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice.toJson(),
    };
  }

  CollectionChartDataList copyWith(
    String? collectionName,
    CollectionSalePrice? collectionSalePrice,
  ) {
    return CollectionChartDataList(
      collectionName ?? this.collectionName,
      collectionSalePrice ?? this.collectionSalePrice,
    );
  }
}

void main() {
  final String filePath = 'lib/lecture_code/debug/chart_data.json';

  String jsonStr = File(filePath).readAsStringSync();
  final Map<String, dynamic> json = jsonDecode(jsonStr);
  print(json.values);
  print(json.keys);
  // CollectionChartDataList collectionChartDataList = CollectionChartDataList.fromJson();
  // print(collectionChartDataList);



}

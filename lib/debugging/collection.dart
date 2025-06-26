import 'package:modu_3_dart_study/debugging/sale_log.dart';

class Collection {
  final String _collectionName; // 컬렉션 이름

  // SaleLog 타입 객체를 모아놓을 리스트.
  // 생성자의 인자를 통해 초기화할 때 사용한다.
  List<SaleLog> _collectionSalePrice = [];

  // 역직렬화 시에 사용할 리스트
  List<dynamic> _dynamicSalePriceList = [];

  // 생성자
  Collection({
    required String collectionName,
    required List<SaleLog> collectionSalePrice,
  }) : _collectionName = collectionName,
       _collectionSalePrice = collectionSalePrice;

  // getter
  String get collectionName => _collectionName;

  // 직렬화
  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> mapSalePriceList = [];

    // SaleLog 인스턴스들이 들어있는 리스트의 모든 객체들에 대해,
    // toJson 메소드를 실행함으로서 Map의 형태로 바꾸고,
    // 동시에 Map<String, dynamic>을 가지는 리스트에 저장한다.
    _collectionSalePrice.forEach((e) => mapSalePriceList.add(e.toJson()));

    return {
      'collectionName': collectionName,
      'collectionSalePrice': mapSalePriceList,
    };
  }

  // 역직렬화
  Collection.fromJson(Map<String, dynamic> json)
    : _collectionName = json['collectionName'],
      // jsonDecode 후 얻게 되는 json['collectionSalePrice']의 타입은 List<dynamic>이므로,
      // List<dynamic> 타입의 리스트를 별도로 두어 역직렬화에 활용.
      _dynamicSalePriceList = json['collectionSalePrice'];
}

// void main() {
//   SaleLog s1 = SaleLog(
//     price: 58.25,
//     cvtDateTime: DateTime(1991, 08, 21, 10, 08, 31),
//   );
//   SaleLog s2 = SaleLog(
//     price: 58.25,
//     cvtDateTime: DateTime(1991, 08, 21, 10, 08, 31),
//   );
//
//   Collection c = Collection(
//     collectionName: 'collection1',
//     collectionSalePrice: [s1, s2],
//   );
//
//   print(jsonEncode(c.toJson()));
//
//   final String bbbb = ''' {
//       "collectionName": "collection1",
//       "collectionSalePrice": [
//         {
//           "price": 58.25,
//           "cvtDatetime": "2023-03-26T08:00:00"
//         },
//         {
//           "price": 58.50,
//           "cvtDatetime": "2023-03-26T08:00:10"
//         }
//       ]
//     }''';
// }

import 'package:modu_3_dart_study/tangible_asset.dart';

class Book extends TangibleAsset {
  final String _isbn; // 고유 번호

  // getter
  String get isbn => _isbn;

  // 생성자
  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required String isbn,
  }) : _isbn = isbn;

  // 생성자(구 방식), super에 대해 제대로 이해하기 위해 적었다
  /*
  Book({
    required String name,
    required int price,
    required String color,
    required double weight,
    required String isbn,
  }) : _isbn = isbn,
       super(name: name, price: price, color: color, weight: weight);
  */
}

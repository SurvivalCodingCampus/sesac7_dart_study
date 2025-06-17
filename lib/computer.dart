import 'package:modu_3_dart_study/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String _makerName; // 제조사 명

  // getter
  String get makerName => _makerName;

  // 생성자
  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required String makerName,
  }) : _makerName = makerName;

  // 생성자(구 방식), super에 대해 제대로 이해하기 위해 적었다
  /*
  Computer({
    required String name,
    required int price,
    required String color,
    required double weight,
    required String makerName,
  }) : _makerName = makerName,
       super(name: name, price: price, color: color, weight: weight);
  */
}

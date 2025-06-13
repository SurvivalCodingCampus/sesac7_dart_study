import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  double _weight;

  // getter 오버라이드
  @override
  double get weight => _weight;

  // setter 오버라이드
  @override
  set weight(double weight) => _weight = weight;

  // 생성자(구 방식), super에 대해 제대로 이해하기 위해 적었다
  /*
  TangibleAsset({
    required String name,
    required int price,
    required String color,
    required double weight,
  }) : super(name: name, price: price, color: color),
       _weight = weight;
  */

  // 생성자
  TangibleAsset({
    required super.name,
    required super.price,
    required super.color,
    required double weight,
  }) : _weight = weight {
    if (weight <= 0) {
      throw Exception('형태가 있는 것이면 무게가 존재합니다.');
    }
  }
}

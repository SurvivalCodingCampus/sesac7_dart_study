import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String _color;
  double _weight;

  // getter
  String get color => _color;

  // setter
  set color(String color) => _color = color;

  // getter 오버라이드
  @override
  double get weight => _weight;

  // setter 오버라이드
  @override
  set weight(double weight) {
    // 무게 최소값 검증
    if (weight <= 0) {
      throw Exception('형태가 있는 것이면 무게가 존재합니다.');
    }

    _weight = weight;
  }

  // 생성자
  TangibleAsset({
    required super.name,
    required super.price,
    required String color,
    required double weight,
  }) : assert(weight > 0, '형태가 있는 것이면 무게가 존재합니다.'),
       _color = color,
       _weight = weight;

  // 생성자(구 방식), super에 대해 제대로 이해하기 위해 적었다
  /*
  TangibleAsset({
    required String name,
    required int price,
    required String color,
    required double weight,
  }) : _weight = weight,
       super(name: name, price: price);
   */
}

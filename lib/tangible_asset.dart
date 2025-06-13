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

  // 생성자
  TangibleAsset({
    required super.name,
    required super.price,
    required super.color,
    required double weight,
  }) : _weight = weight;
}

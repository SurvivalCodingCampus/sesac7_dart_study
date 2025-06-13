import 'package:modu_3_dart_study/assignments/asset/asset.dart';
import 'package:modu_3_dart_study/assignments/asset/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  final String color;

  double _weight;

  TangibleAsset(
    super.name, {
    required super.price,
    required this.color,
    required double weight,
  }) : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    if (value < Thing.minWeight) {
      throw Exception('무게는 ${Thing.minWeight}보다 커야 합니다.');
    }

    _weight = value;
  }
}

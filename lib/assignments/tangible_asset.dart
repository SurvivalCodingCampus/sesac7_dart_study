import 'package:modu_3_dart_study/assignments/asset.dart';
import 'package:modu_3_dart_study/assignments/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  final String color;
  double _weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    if (value < 0) {
      throw Exception('무게는 마이너스 불가');
    }
    _weight = value;
  }

  TangibleAsset(
    this._weight, {
    required super.name,
    required super.price,
    required this.color,
  });
}

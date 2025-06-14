import 'package:modu_3_dart_study/assignments/2025-06-13/asset.dart';
import 'package:modu_3_dart_study/assignments/2025-06-13/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  final String color;
  double _weight;

  TangibleAsset(
    this._weight, {
    required super.name,
    required super.price,
    required this.color,
  });

  @override
  double get weight {
    return _weight;
  }

  @override
  set weight(double value) {
    _weight = value;
  }
}

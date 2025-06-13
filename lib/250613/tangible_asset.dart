import 'package:modu_3_dart_study/250613/asset.dart';
import 'package:modu_3_dart_study/250613/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  final String color;
  double _weight;

  @override
  double get weight {
    return _weight;
  }

  @override
  set weight(double value) {
    _weight = value;
  }

  TangibleAsset({
    required double weight,
    required super.name,
    required super.price,
    required this.color,
  }) : _weight = weight;
}

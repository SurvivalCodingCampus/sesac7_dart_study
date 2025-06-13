import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String _color;
  double _weight;

  String get color => _color;

  @override
  double get weight => _weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required String color,
    required double weight,
  }) : _color = color,
       _weight = weight;

  set color(String value) {
    if (value.isNotEmpty) {
      _color = value;
    }
    _color = '';
  }

  @override
  set weight(double value) {
    if (value > 0) {
      _weight = value;
    }
    _weight = 0.0;
}

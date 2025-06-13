import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String _color;

  @override
  double weight;

  String get color => _color;

  TangibleAsset({
    required super.name,
    required super.price,
    required String color,
    required this.weight,
  }) : _color = color;

  set color(String value) {
    if (value.isNotEmpty) {
      _color = value;
    }
    _color = '';
}

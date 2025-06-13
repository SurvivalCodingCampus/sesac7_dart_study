import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  final String _color;

  String get color => _color;

  TangibleAsset({
    required super.name,
    required super.price,
    required String color,
  }) : _color = color;
}

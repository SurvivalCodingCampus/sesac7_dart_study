import 'package:modu_3_dart_study/asset.dart';

abstract class TangibleAsset extends Asset {
  final String _color;

  String get color => _color;

  TangibleAsset({
    required super.name,
    required super.price,
    required String color,
  }) : _color = color;
}

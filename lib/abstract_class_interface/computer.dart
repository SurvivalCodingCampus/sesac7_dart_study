import 'package:modu_3_dart_study/abstract_class_interface/tangible_asset.dart';

class Computer extends TangibleAsset {
  String _makerName;

  String get makerName => _makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required String makerName,
    required super.weight,
  }) : _makerName = makerName;

  set makerName(String value) {
    _makerName = value;
  }
}

import 'package:modu_3_dart_study/abstract_class_interface/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
    required super.weight,
  });
}

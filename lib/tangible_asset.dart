import 'package:modu_3_dart_study/asset.dart';

abstract class TangibleAsset extends Asset {
  String color;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
  });
}

import 'package:modu_3_dart_study/asset.dart';
import 'package:modu_3_dart_study/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;

  @override
  double weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required this.weight,
  });
}

import 'package:modu_3_dart_study/assignments/2025-06-13/asset.dart';
import 'package:modu_3_dart_study/assignments/2025-06-13/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required this.weight,
  });


}

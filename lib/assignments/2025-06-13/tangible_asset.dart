import 'package:modu_3_dart_study/assignments/2025-06-13/asset.dart';
import 'package:modu_3_dart_study/assignments/2025-06-13/thing.dart';

abstract class Tangibleasset extends Asset implements Thing {
  String color;
  @override
  double weight;

  Tangibleasset(
    super.name, {
    required super.price,
    required this.color,
    required this.weight,
  });
}

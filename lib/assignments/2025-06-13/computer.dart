import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';

class Computer extends Tangibleasset {
  String makerName;

  Computer(
    super.name, {
    required super.price,
    required super.color,
    required super.weight,
    required this.makerName,
  });
}

import 'package:modu_3_dart_study/assignments/asset/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String makerName;

  Computer(
    super.name, {
    required super.price,
    required super.color,
    required this.makerName,
    required super.weight,
  });
}

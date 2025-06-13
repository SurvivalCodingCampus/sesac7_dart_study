import 'package:modu_3_dart_study/250613/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String makerName;

  Computer(
    super._weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
  });
}

import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(
    super.weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
  });
}

import 'package:modu_3_dart_study/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String _makerName;

  @override
  double weight;

  String get makerName => _makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required String makerName,
    required this.weight,
  }) : _makerName = makerName;
}

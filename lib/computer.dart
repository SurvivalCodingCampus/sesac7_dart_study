import 'package:modu_3_dart_study/tangible_asset.dart';

class Computer extends TangibleAsset {
  String _makerName;

  // getter
  String get makerName => _makerName;

  // 필요한 경우 setter 추가

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required String makerName,
  }) : _makerName = makerName;
}

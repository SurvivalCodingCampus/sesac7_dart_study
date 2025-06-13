import 'package:modu_3_dart_study/asset/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  @override
  double weight;

  @override
  double tangibleAssetDepth;

  @override
  double tangibleAssetHeight;

  @override
  double tangibleAssetWidth;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.texture,
    required this.makerName,
    required this.weight,
    required this.tangibleAssetWidth,
    required this.tangibleAssetHeight,
    required this.tangibleAssetDepth,
  });
}

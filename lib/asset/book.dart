import 'package:modu_3_dart_study/asset/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  @override
  double weight;

  @override
  double tangibleAssetDepth;

  @override
  double tangibleAssetHeight;

  @override
  double tangibleAssetWidth;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.texture,
    required this.isbn,
    required this.weight,
    required this.tangibleAssetWidth,
    required this.tangibleAssetHeight,
    required this.tangibleAssetDepth,
  });

  @override
  void destroy() {
    super.destroy();
    weight = 0.0;
    tangibleAssetWidth = 0.0;
    tangibleAssetHeight = 0.0;
    tangibleAssetDepth = 0.0;
  }
}

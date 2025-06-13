import 'package:modu_3_dart_study/asset/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;
  bool isSealed;
  bool _checkSealed = false;

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
    required this.isSealed,
    required this.weight,
    required this.tangibleAssetWidth,
    required this.tangibleAssetHeight,
    required this.tangibleAssetDepth,
  }) {
    valueAdjustment();
  }

  @override
  void destroy() {
    super.destroy();
    weight = 0.0;
    tangibleAssetWidth = 0.0;
    tangibleAssetHeight = 0.0;
    tangibleAssetDepth = 0.0;
  }

  @override
  void valueAdjustment() {
    if (_checkSealed) {
      print('이미 밀봉 여부를 확인해서 가격을 올렸습니다.');
      return;
    }
    if (isSealed) {
      price += 5000;
      _checkSealed = true;
    }
  }
}

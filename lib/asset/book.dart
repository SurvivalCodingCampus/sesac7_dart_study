import 'package:modu_3_dart_study/asset/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;
  bool _isSealed;
  bool _bookValueAdjustmentChange = false;

  final int sealPrice = 5000;

  set isSealed(bool value) {
    if (value != _isSealed) {
      _isSealed = value;
      _bookValueAdjustmentChange = true;
      valueAdjustment();
    }
  }

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
    required bool isSealed,
    required this.weight,
    required this.tangibleAssetWidth,
    required this.tangibleAssetHeight,
    required this.tangibleAssetDepth,
  }) : _isSealed = isSealed {
    _bookValueAdjustmentChange = true;
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
    if (_bookValueAdjustmentChange) {
      price = _isSealed
          ? excludeValueAdjustmentPrice + sealPrice
          : excludeValueAdjustmentPrice - sealPrice;
      _bookValueAdjustmentChange = false;
    }
  }
}

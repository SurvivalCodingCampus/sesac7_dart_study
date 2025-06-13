import 'package:modu_3_dart_study/asset/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;
  bool _isOsInstalled;
  bool _computerValueAdjustChange = false;

  final int osInstallPrice = 100000;

  set isOsInstall(bool value) {
    if (value != _isOsInstalled) {
      _isOsInstalled = value;
      _computerValueAdjustChange = true;
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

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.texture,
    required this.makerName,
    required bool isOsInstall,
    required this.weight,
    required this.tangibleAssetWidth,
    required this.tangibleAssetHeight,
    required this.tangibleAssetDepth,
  }) : _isOsInstalled = isOsInstall {
    _computerValueAdjustChange = true;
    valueAdjustment();
  }

  @override
  void valueAdjustment() {
    if (_computerValueAdjustChange) {
      price = _isOsInstalled
          ? price += osInstallPrice
          : price -= osInstallPrice;
      _computerValueAdjustChange = false;
    }
  }
}

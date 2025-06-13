import 'package:modu_3_dart_study/asset/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;
  bool isOsInstall;
  bool _checkOsInstallPay = false;

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
    required this.isOsInstall,
    required this.weight,
    required this.tangibleAssetWidth,
    required this.tangibleAssetHeight,
    required this.tangibleAssetDepth,
  }) {
    valueAdjustment();
  }

  @override
  void valueAdjustment() {
    if (_checkOsInstallPay) {
      print('이미 OS 설치 여부를 확인해서 가격을 올렸습니다.');
      return;
    }
    if (isOsInstall) {
      price += 100000;
      _checkOsInstallPay = true;
    }
  }
}

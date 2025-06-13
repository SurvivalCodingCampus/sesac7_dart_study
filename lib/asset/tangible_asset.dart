import 'package:modu_3_dart_study/asset/asset.dart';

import '../interface/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  String texture;
  bool _isDestroy = false;

  final int excludeValueAdjustmentPrice; // 가치 조정 전 금액

  TangibleAsset({
    required super.name,
    required this.price,
    required this.color,
    required this.texture,
  }) : excludeValueAdjustmentPrice = price;

  // 추상 메서드
  void valueAdjustment(); // 가치조정

  void grab() {
    if (_isDestroy) {
      throw Exception('$name이/가 파괴되어서 잡을 수 없습니다.');
    } else {
      print(
        '$name을/를 잡았습니다.\n재질: $texture 무게: $weight width: $tangibleAssetWidth height: $tangibleAssetHeight depth: $tangibleAssetDepth',
      );
    }
  }

  void destroy() {
    _isDestroy = true;
  }
}

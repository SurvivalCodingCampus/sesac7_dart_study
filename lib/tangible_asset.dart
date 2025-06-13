import 'package:modu_3_dart_study/asset.dart';

abstract class TangibleAsset extends Asset {
  // 생성자
  TangibleAsset({
    required super.name,
    required super.price,
    required super.color,
  });
}

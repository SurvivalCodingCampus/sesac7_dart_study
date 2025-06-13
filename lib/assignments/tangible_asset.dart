import 'package:modu_3_dart_study/assignments/asset.dart';

abstract class TangibleAsset extends Asset {
  String color;

  TangibleAsset(super.name, super.price, this.color);
}

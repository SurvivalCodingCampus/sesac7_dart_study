import 'package:modu_3_dart_study/assignments/2025-06-13/asset.dart';

abstract class Tangibleasset extends Asset {
  String color;

  Tangibleasset(super.name, super.price, this.color);
}

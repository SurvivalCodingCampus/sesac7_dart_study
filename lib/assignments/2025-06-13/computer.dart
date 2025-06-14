import 'package:modu_3_dart_study/assignments/2025-06-13/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, this.makerName);
}

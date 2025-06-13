import 'package:modu_3_dart_study/assignments/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, this.makerName);
}

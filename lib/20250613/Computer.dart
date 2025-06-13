import 'package:modu_3_dart_study/20250613/tangibleAsset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, this.makerName);
}
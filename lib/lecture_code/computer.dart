import 'package:modu_3_dart_study/lecture_code/tangibleasset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, this.makerName);

  @override
  double get weight => 1.0;

  @override
  set weight(double weight) {
  }
}
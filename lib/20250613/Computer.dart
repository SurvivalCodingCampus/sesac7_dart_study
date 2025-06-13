import 'package:modu_3_dart_study/20250613/tangibleAsset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, {required super.price, required super.color, required super.weight, required this.makerName});
}

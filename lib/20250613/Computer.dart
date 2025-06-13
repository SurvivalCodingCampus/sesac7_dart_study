import 'package:modu_3_dart_study/20250613/tangibleAsset.dart';

class Computer extends TangibleAsset {
  String makerName;
  double _weight = 0.0;

  Computer(super.name, {required super.price, required super.color, required this.makerName});

  @override
  double get weight => _weight;

  @override
  set weight(double weight) => _weight = weight;
}

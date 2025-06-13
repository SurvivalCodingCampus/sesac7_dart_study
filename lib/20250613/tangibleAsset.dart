import 'package:modu_3_dart_study/20250613/thing.dart';

import 'asset.dart';

abstract class TangibleAsset extends Asset implements Thing{
  String color;
  double weight;

  TangibleAsset(super.name, {required super.price, required this.color, required this.weight});

  @override
  double getWeight() => weight;

  @override
  void setWeight(double weight) => this.weight = weight;
}
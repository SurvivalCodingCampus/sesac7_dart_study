import 'package:modu_3_dart_study/asset/asset.dart';

abstract class TangibleAsset extends Asset {
  int price;
  String color;

  TangibleAsset({required super.name, required this.price, required this.color});
}
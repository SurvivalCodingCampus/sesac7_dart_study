import 'asset.dart';

abstract class TangibleAsset extends Asset {
  String color;

  TangibleAsset(super.name, super.price, this.color);
}
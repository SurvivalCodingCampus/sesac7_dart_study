import 'asset.dart';

abstract class IntangibleAsset extends Asset {
  String right; // 권리

  IntangibleAsset(super.name, super.price, this.right);
}
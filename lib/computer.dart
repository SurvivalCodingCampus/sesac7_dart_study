import 'package:modu_3_dart_study/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String _makerName;

  String get makerName => _makerName;

  Computer(super.name, super.price, super.color, String makerName)
    : _makerName = makerName;
}

import 'package:modu_3_dart_study/assignments/asset.dart';

abstract class IntangibleAsset extends Asset {
  final String patent;

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.patent,
  });
}

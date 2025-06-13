import 'package:modu_3_dart_study/250613/asset.dart';

abstract class IntangibleAsset extends Asset {
  final String patent;

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.patent,
  });
}

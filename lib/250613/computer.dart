import 'package:modu_3_dart_study/250613/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String makerName;

  Computer({
    required super.weight,
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
  });

  // Computer({
  //   required double weight, // weight를 이름 기반 파라미터로 받아서,
  //   required super.name,
  //   required super.price,
  //   required super.color,
  //   required this.makerName,
  // }) : super(weight); // super()를 통해 위치 기반 파라미터로 전달
}

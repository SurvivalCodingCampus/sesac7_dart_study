import 'package:modu_3_dart_study/20250613/intangibleAsset.dart';

class Patent extends IntangibleAsset {
  String country; // 지역성(국가별)

  Patent(super.name, {required super.price, required super.right, required this.country});
}
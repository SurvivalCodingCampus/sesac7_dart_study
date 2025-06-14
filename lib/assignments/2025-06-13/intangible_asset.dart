import 'package:modu_3_dart_study/assignments/2025-06-13/asset.dart';

abstract class IntangibleAsset extends Asset {
  String scalability; //확장성. 무형자산의 특징중 하나.
  IntangibleAsset(super.name, super.price, this.scalability);
}

import 'package:modu_3_dart_study/20250613/thing.dart';

import 'asset.dart';

abstract class TangibleAsset extends Asset implements Thing{
  String color;
  TangibleAsset(super.name, {required super.price, required this.color});

  // Thing 인터페이스에서 이미 선언됨
  // TangibleAsset은 추상클래스므로 생략 가능함
  // 대신 TangibleAsset를 상속받은 클래스에서 반드시 구현해야함
  // @override
  // double get weight;
  //
  // @override
  // set weight(double value);
}
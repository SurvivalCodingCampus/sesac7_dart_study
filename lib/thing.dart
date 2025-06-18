import 'asset.dart';

// 형태가 있는것
abstract interface class Thing{
  double get weight;
  set weight(double value);
}

// 나 : 무형자산
abstract class IntangibleAsset {}

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;

  TangibleAsset({required super.name, required this.price, required this.color, });
}

// 다 : 특허권
class Patent extends IntangibleAsset{}
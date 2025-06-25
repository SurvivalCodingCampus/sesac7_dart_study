import 'asset.dart';

// 형태가 있는것
// abstract 없이 interface 만 가지는 경우 생성자가 자동으로 생기기 때문에 의도한 의미의 interface대로 사용할 수 없다
// Q? 왜?
abstract interface class Thing{
  double get weight;
  set weight(double value);
}

// 나 : 무형자산
abstract class IntangibleAsset {}

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;

  TangibleAsset({required super.name, required this.price, required this.color,});
}

// 다 : 특허권
class Patent extends IntangibleAsset{}
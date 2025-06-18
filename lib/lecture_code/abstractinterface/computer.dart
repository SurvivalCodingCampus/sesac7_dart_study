import 'package:modu_3_dart_study/lecture_code/abstractinterface/tangibleasset.dart';
import 'package:modu_3_dart_study/lecture_code/abstractinterface/thing.dart';

class Computer extends TangibleAsset {
  String makerName;

  @override
  double weight; //인터페이스에 getter/setter가 있으면 non-final 필드 하나로 가능하다.

  Computer(super.name, super.price, super.color, this.makerName, {this.weight = 1.1});
}

void main() {
  Thing t = Computer("name", 1, "color", "makerName");
  t.weight = 2.2;
  print(t.weight);
}

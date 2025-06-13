import 'package:modu_3_dart_study/20250613/tangibleAsset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, {required super.price, required super.color, required super.weight, required this.makerName});
}

void main() {
  Computer computer = Computer('맥프로', price: 2000000, color: 'silver', weight: 2, makerName: 'apple');
  print('맥프로 무게는 : ${computer.weight}');
}
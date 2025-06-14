import 'package:modu_3_dart_study/monster/slime.dart';

// 전투 가능한
abstract interface class Attackable {
  void attack(Slime target); // 슬라임 공격
  void defend();
}
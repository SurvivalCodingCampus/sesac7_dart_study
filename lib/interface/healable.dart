import 'package:modu_3_dart_study/character/hero.dart';

// 치유 가능한
abstract interface class Healable {
  void heal(Hero target); // Hero만 치유 가능
}
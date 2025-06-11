import 'package:modu_3_dart_study/wand.dart';

class Wizard {
  String name;
  int hp;
  int mp;
  Wand? wand;

  Wizard(this.name, {required this.hp, required this.mp, this.wand});
}

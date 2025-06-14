import '../monster/slime.dart';

abstract class Character {
  String name;
  int hp;

  Character({required this.name, required this.hp});

  void run() {
   print('$name이 도망쳤다.');
  }

  void attack(Slime slime);
}
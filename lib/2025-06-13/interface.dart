import 'package:modu_3_dart_study/hero.dart';

// 인터페이스의 활용

// 전투 가능한
abstract interface class Attackable {
  void attack(Slime target);
  void defend();
}

// 치유 가능한
abstract interface class Healable {
  void heal(Hero target);
}

// 여러 인터페이스를 구현할 수 있다
class Hero implements Attackable, Healable {
  final String name;
  int hp = 100;

  Hero(this.name);
  
  @override
  void attack(Slime target) {
    print('$name의 물리 공격!');
    target.hp -= 10;
    print('${target.suffix}에게 10의 데미지! 남은 HP: ${target.hp}');
  }
  
  @override
  void defend() {
    // TODO: implement defend
  }
  
  @override
  void heal(Hero target) {
    // TODO: implement heal
  }  
}

// extends 와 implements 를 동시에 사용

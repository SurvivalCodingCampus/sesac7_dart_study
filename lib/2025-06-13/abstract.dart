import 'package:modu_3_dart_study/hero.dart';

abstract class Character{
  String name;
  int hp;

  Character(this.name, this.hp);

  void run(){
    print('$name이 도망쳤다');
  }

  // 추상 메소드
  void attack(Slime slime);
}

// 추상 클래스에서 확장하는 클래스는 필수로 필드를 작성, 오버라이드 해야함
class Dancer extends Character{

  Dancer(super.name, super.hp);

  @override
  void attack(Slime slime) {
    // TODO: implement attack
  }

}
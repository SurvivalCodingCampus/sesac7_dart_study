import 'package:modu_3_dart_study/assignments/2025-06-12/hero.dart';

class Slime {
  int _hp;
  final String suffix;
  static const int damage = 10;

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      _hp = _hp;
    } else {
      _hp = value;
    }
  }

  Slime(this.suffix, {int hp = 50}) : _hp = hp;

  void attack(Hero hero) {
    print('슬라임 \'$suffix\'이/가 \'${hero.name}\'을/를 공격했다.');
    print('$damage포인트의 데미지');
    hero.hp -= damage;
  }
}

/*
이 클래스를 이용해, 다음 사양을 따르는 PoisonSlime 클래스를 작성하시오
1. 독 슬라임(PoisonSlime) 은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
2. PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
   PoisonSlime poisonSlime = PoisonSlime(‘A’);
3. PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다
4. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
    우선, “보통 슬라임과 같은 공격"을 한다
    poisonCount가 0이 아니면 다음을 추가로 수행한다
    화면에 “추가로, 독 포자를 살포했다!” 를 표시
    용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
    poisonCount 를 1 감소 시킨다
*/

class PoisonSlime extends Slime {
  int _poisonCount = 5;

  PoisonSlime(super.suffix);

  int get poisonCount => _poisonCount;

  set poisonCount(int value) {
    if (value < 0) {
      _poisonCount = 0;
    } else {
      _poisonCount = value;
    }
  }

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (_poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      final int poisonDamage = (hero.hp / 5).toInt();
      hero.hp -= poisonDamage;
      print('$poisonDamage포인트의 데미지');
      _poisonCount -= 1;
    }
  }
}

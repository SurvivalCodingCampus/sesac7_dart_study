import 'package:modu_3_dart_study/character/hero.dart';
import 'package:modu_3_dart_study/monster/slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;
  int get poisonCount => _poisonCount;
  set poisonCount(int value) {
    if (value < 0) {
      throw Exception('독 슬라임의 poisonCount는 0보다 작을 수 없습니다.');
    } else {
      _poisonCount = value;
    }
  }

  final double _poisonDamageRatio = 1 / 5;
  double get poisonDamageRatio => _poisonDamageRatio;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (_poisonCount == 0) {
      print('$suffix 독 슬라임의 poisonCount를 모두 소모 했습니다.');
      return;
    }

    print('추가로, 독 포자를 살포했다!');
    final int poisonDamage = (hero.hp * _poisonDamageRatio).toInt();
    hero.hp -= poisonDamage;
    print('$poisonDamage포인트의 데미지');
    poisonCount--;
  }
}
import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;
  final double _poisonDamageRatio = 1 / 5;

  PoisonSlime(super.suffix);

  int get poisonCount => _poisonCount;
  set poisonCount(int value) {
    if (_poisonCount == 0 && value < 0) {
      throw Exception('독 슬라임의 poisonCount는 0보다 작을 수 없습니다.');
    } else {
      _poisonCount = value;
    }
  }

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
    _poisonCount--;
  }
}
import 'package:modu_3_dart_study/assignments/2025-06-12/slime.dart';
import 'package:modu_3_dart_study/hero.dart';

class SuperHero extends Hero {
  bool _isFlying = false;

  SuperHero({required super.name, required super.hp});

  bool get isFlying => _isFlying;

  set isFlying(bool value) {
    _isFlying = value;
    if (value) {
      print('$name 이 날개를 펼쳤다.');
    } else {
      print('$name 이 날개를 접었다.');
    }
  }

  @override
  void attack(Slime slime) {
    // TODO: implement attack
    print('$name이 $slime을 공격했다.');
    slime.hp -= 5;
  }

  @override
  void run() {
    print('$name이 도망쳤다.');
  }
}

void main() {
  Hero hero = Hero(name: '홍길동', hp: 100);
  hero.run();

  SuperHero superHero = SuperHero(name: '한석봉', hp: 100);
  superHero.run();
}

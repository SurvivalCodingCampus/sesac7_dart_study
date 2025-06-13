import 'hero.dart';

// poison slime은 slime 중에서 독 공격이 되는 slime
class PoisonSlime extends Slime {
  // 독 공격 가능 횟수를 저장하는 poisonCount의 초기값 5
  int intPoisonCount = 5;
  int poisonCount = 5;
  // int get poisonCount => _poisonCount;
  // set poisonCount(int poisonCount){
  //   _poisonCount = poisonCount;
  // }

  PoisonSlime(super.suffix); // 생성자 명시

  @override
  void attack(Hero hero) {
    // 보통 slime 과 같은 공격
    super.attack(hero);

    // poisonCount가 0이 아닐때
    // 화면에 '추가로, 독 포자를 살포했다!' 를 표시
    double poisonDamage = hero.hp / 5;

    if (poisonCount == 0) {
      throw Exception('더이상 독 포자를 사용할 수 없습니다');
    } else {
      print('추가로, 독 포자를 살포했다!');
      // 용사의 hp의 1/5에 해당하는 포인트를 용사의 hp로 부터 감소시키고
      // int 로 변환 toInt
      hero.hp -= poisonDamage;
      print('$poisonDamage의 데미지');

      print('후 영웅 hp ${hero.hp}');
      // poisonCount 1 감소
      poisonCount -= 1;
    }
  }
}

void main() {
  // 아래의 코드로 인스턴스화 되는 클래스
  // PoisonSlime poisonSlime = PoisonSlime('A');
  final PoisonSlime poisonSlime = PoisonSlime('A');
  print('$poisonSlime');
}

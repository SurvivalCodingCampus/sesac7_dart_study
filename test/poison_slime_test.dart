import 'package:modu_3_dart_study/hero.dart';
import 'package:modu_3_dart_study/poison_slime.dart';
import 'package:test/test.dart';

void main() {
  test('Given PoisonSlime class when 인스턴스 생성 시 then poisonCount의 값은 5이어야', () {
    // given(준비)
    PoisonSlime poisonSlimeA = PoisonSlime('A');
    // when (실행)
    // then (검증)
    expect(poisonSlimeA.poisonCount, 5);
  });

  test(
    'Given Hero class and PoisonSlime class when attack method 호출하면 then 우선은 보통 슬라임 공격'
    'then hero의 hp가 10 감소하여야 하고, 추가 독공격으로 hero의 hp가 추가로 1/5 만큼 감소해야 하고,'
    'PoisonSlime의 poisonCount는 1 감소한 4이어야',
    () {
      // given(준비)
      PoisonSlime poisonSlimeB = PoisonSlime('B');
      int initialMp = 102;
      Hero heroB = Hero(name: 'heroB', hp: initialMp);
      // when (실행)
      poisonSlimeB.attack(heroB);
      // then (검증)
      expect(heroB.hp, (initialMp - 10) - ((initialMp - 10) ~/ 5));
      expect(poisonSlimeB.poisonCount, 4);

      // attack method 가 호출되더라도 PoisonSlime의 poisonCount가 0이면 then 추가 독공격은 못하여 '
      // 'hero의 hp는 10만 감소
      poisonSlimeB.attack(heroB);
      poisonSlimeB.attack(heroB);
      poisonSlimeB.attack(heroB);
      poisonSlimeB.attack(heroB);
      expect(poisonSlimeB.poisonCount, 0);

      // PoisonSlime의 poisonCount가 0인 상태에서의 heroB의 Hp
      int heroBHpAfter5Attack = heroB.hp;

      poisonSlimeB.attack(heroB);
      expect(heroB.hp, heroBHpAfter5Attack - 10);
    },
  );
}

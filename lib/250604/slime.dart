/*
이 클래스를 이용해, 다음 사양을 따르는 PoisonSlime 클래스를 작성하시오
01. 독 슬라임(PoisonSlime) 은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
 - super에 독공격(poisonAttack)사용한다.

02. PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
   PoisonSlime poisonSlime = PoisonSlime(‘A’);
 - 인스턴스화 즉 클래스.

03. PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다
 - 초기값 설정
 - 캡슐화

04. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
  a. 우선, “보통 슬라임과 같은 공격"을 한다.
   - super클래스 attack()실행

  b. poisonCount가 0이 아니면 다음을 추가로 수행한다
   - poision 조건 검사

  c. 화면에 “추가로, 독 포자를 살포했다!” 를 표시
   - poisonCount가 0이상이면(즉 0과 같거나 작으면 return), print(“추가로, 독 포자를 살포했다!”)

  d. 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
   - Hero HP 1/5감소, 감소량 저장, print(“~포인트의 데미지")
   - Hero set에서??

  e. poisonCount 를 1 감소 시킨다
   - setter를 사용, poisonCount-=1;

* */

import 'hero.dart';

class Slime{
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero){
    print('슬라임 $suffix가 공격했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

class PoisonSlime extends Slime{
  PoisonSlime(super.suffix);

  // 03. PoisonSlime 독 공격 가능 횟수를 저장하는 poisonCount(초기값 5)를 가진다
  //  - 초기값 설정
  //  - 캡슐화
  int _poisonCount = 5;

  set poisonCount(int value) {
    _poisonCount = value;
  }

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    //  b. poisonCount가 0이 아니면 다음을 추가로 수행한다
    //    - poision 조건 검사 (0과 같거나 작으면 return)

    if(poisonCount <=0) return;

    // 04. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
    //   a. 우선, “보통 슬라임과 같은 공격"을 한다.
    //   - super클래스 attack()실행
    super.attack(hero);
    // 01. 독 슬라임(PoisonSlime) 은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
    print('🤢 추가로, 독 포자를 살포했다!');

    //  d. 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
    //    - Hero HP 1/5감소, 감소량 저장, print(“~포인트의 데미지")
    //    - Hero set에서??
    // 감소하는 메서드는 hero 클래스에서.
    hero.damageHeroHp();

    // e. poisonCount 를 1 감소 시킨다
    //    - poisonCount-=1;
    poisonCount -=1;
  }
}

void main(){
}
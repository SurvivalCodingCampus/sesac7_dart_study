/*
* hp : 캡슐화
* */

class Hero {
  final String name;

  int _hp;
  final hpDamagePercent = 0.20; // HP의 1/5 포인트 감소를 위한 변수

  set hp(int hp) => _hp = hp;
  int get hp => _hp;

  // 생성자
  Hero(this.name, this._hp);

  void attack() {
    print('$name is attacking!');
  }

  void run() {
    print('$name is running away!');
  }

  void sit() {
    print('$name is sitting for 2 seconds.');
  }

  void slip() {
    print('$name slipped and fell!');
  }

  void sleep() {
    hp = 100;
    print('$name is sleeping.');
  }

  //  d. 용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
  //    - Hero HP 1/5감소, 감소량 저장, print(“~포인트의 데미지")
  //    - Hero set에서??
  // 감소하는 메서드는 hero 클래스에서.
  void damageHeroHp() {
    // Hero가 영원이 죽지않아
    // if(hp == 1) {
    //   print("💀 Hero 사망하였음");
    //   return;
    // }
    int damageHp = (hp * hpDamagePercent).round(); //반올림
    print("🥲 $damageHp포인트의 데미지");
    if (hp < 0) return;
    hp -= damageHp;
  }
}

void main() {
  Hero hero = Hero('홍길동', 100);

  // 공격, 도망, 잠자기
  hero.attack();
  hero.run();
  hero.sleep();
}

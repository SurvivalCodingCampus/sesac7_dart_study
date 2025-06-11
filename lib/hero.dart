class Hero {
  String name;
  int hp;

  ///객체를 새로 생성 할때는 생성자를 통해 만드는게 규칙이야.
  ///기본 생성자.
  Hero(this.name, this.hp);

  ///기능 추가. 메소드
  void attack() {
    hp--;
  }

  void run() {}

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자고 회복했다.');
  }
}

class Slime {
  int hp;
  final int level =
      10; //필드를 상수로 선언. 모든 슬라임은 레벨이 10이다. 상수 값은 이미 값이 정해져 있기 때문에 생성자에 넣지 않아도 된니까.
  String suffix;

  Slime(this.hp, this.suffix);

  void run() {
    print('슬라임 $suffix 가 도망갔다!');
  }
}

void main() {
  Hero hero = Hero('홍길동', 100); //생성자 호출하면서 hero 인스턴스 생성.

  Slime slime1 = Slime(50, 'A');
  Slime slime2 = Slime(48, 'B');

  hero.attack();
  slime1.run();
  slime2.run();
  hero.run();
  hero.sleep();
}

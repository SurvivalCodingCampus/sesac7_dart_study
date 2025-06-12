import 'assignments/2025-06-12/slime.dart';

class Hero {
  String name;
  int hp;

  ///객체를 새로 생성 할때는 생성자를 통해 만드는게 규칙이야.
  ///기본 생성자.
  Hero({required this.name, required this.hp});

  ///기능 추가. 메소드
  void attack(Slime slime) {}

  void run() {
    print('hero 의 run');
  }

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자고 회복했다.');
  }
}

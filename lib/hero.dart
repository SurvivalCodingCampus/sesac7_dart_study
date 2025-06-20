import 'assignments/2025-06-12/slime.dart';

class Hero implements Comparable<Hero> {
  String name;
  int hp;
  int maxHp = 100;

  ///객체를 새로 생성 할때는 생성자를 통해 만드는게 규칙이야.
  ///기본 생성자.
  Hero({required this.name, required this.hp});

  ///기능 추가. 메소드
  void attack(Slime slime) {
    print('attack');
  }

  void run() {
    print('hero 의 run');
  }

  void sleep() {
    hp = 100;
    print('$name 은 잠을 자고 회복했다.');
  }

  ///toString() 재정의
  @override
  String toString() {
    return 'Hero{name: $name, hp: $hp, maxHp: $maxHp}';
  }

  ///== equals()재정의 - 이름이 같으면 같은걸로 볼래.
  @override
  bool operator ==(Object hero) {
    if (hero is Hero) {
      return this.name == hero.name;
    }
    return false;
  }

  ///String(name)이 주는 해시코드.
  @override
  // TODO: implement hashCode
  int get hashCode => name.hashCode;

  @override
  int compareTo(Hero other) {
    // TODO: implement compareTo
    return name.compareTo(other.name);
  }

  ///CopyWith 복사. 객체 복사
  Hero copyWith({String? name, int? hp}) {
    return Hero(name: name ?? this.name, hp: hp ?? this.hp);
  }
}

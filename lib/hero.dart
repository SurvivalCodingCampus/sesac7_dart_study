// top level
const int heroMoney = 100;

class Hero implements Comparable<Hero> {
  // 무관계
  static int money = 100;

  String _name;
  int _hp;

  // getter
  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  int get myHp => _hp * 100;

  String get name => _name;

  set name(String value) {
    if (value.length <= 1) {
      throw Exception('이름이 너무 짧다');
    }
  }

  Hero({
    required String name,
    required int hp,
  }) : _hp = hp,
       _name = name;

  static void setRandomMoney() {
    Hero.money = 200;

    // Hero hero = Hero(name: 'name');
    // hero._hp = 100;
  }

  void attack() {
    _hp--;
  }

  void run() {
    print('hero 의 run()');
  }

  @override
  String toString() {
    return 'Hero{_name: $_name, _hp: $_hp}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hero &&
          runtimeType == other.runtimeType &&
          _name == other._name &&
          _hp == other._hp;

  @override
  int get hashCode => _name.hashCode ^ _hp.hashCode;

  @override
  int compareTo(Hero other) {
    return -hp.compareTo(other.hp);
  }

  // 동등성 비교 규칙 재정의

  Hero copyWith({
    String? name,
    int? hp,
  }) {
    return Hero(
      name: name ?? this.name,
      hp: hp ?? this.hp,
    );
  }
}

void main() {
  // Hero('홍길동', 50)
  // Hero(60, 10, 5, 5, 2)

  // Named Parameter
  Hero hero = Hero(name: '홍길동', hp: 50);
  hero.attack();
  Hero.setRandomMoney();
  print(hero.hp); // 99

  hero.name = '이';

  String name = '홍길동';
  int i = 10;
}

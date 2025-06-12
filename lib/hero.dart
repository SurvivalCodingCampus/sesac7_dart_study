// top level
const int heroMoney = 100;

class Hero {
  // 무관계
  static int money = 100;

  String _name;
  int _hp;

  // getter
  int get hp => _hp;

  int get myHp => _hp * 100;

  String get name => _name;

  set name(String value) {
    if (value.length <= 1) {
      throw Exception('이름이 너무 짧다');
    }
  }

  Hero(this._name, {required int hp}) : _hp = hp;

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
}

void main() {
  // Hero('홍길동', 50)
  // Hero(60, 10, 5, 5, 2)

  // Named Parameter
  Hero hero = Hero('홍길동', hp: 50);
  hero.attack();
  Hero.setRandomMoney();
  print(hero.hp); // 99

  hero.name = '이';

  String name = '홍길동';
  int i = 10;
}

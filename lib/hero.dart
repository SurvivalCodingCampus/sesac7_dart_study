class Hero {
  String name;
  int _hp; // private 필드
  final int _maxHp;

  int get hp => _hp; // hp라는 프로퍼티가 만들어짐
  int get maxHp => _maxHp;

  Hero({required this.name, int hp = 100}) : _maxHp = hp, _hp = hp; // 뭐지?

  set hp(int value) {
    _hp = value;
    if (value < 0) {
      _hp = 0;
    }
  }

  void attack() {
    _hp--;
  }
}

void main() {
  final hero = Hero(name: '홍길동');

  hero.attack();
  print(hero.hp);
}

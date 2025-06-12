class Hero {
  String name;
  int _hp; // private 필드

  int get hp => _hp; // hp라는 프러퍼티가 만들어짐

  Hero({required this.name, int hp = 100}) : _hp = hp;

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

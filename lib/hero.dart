class Hero {
  String name;
  int hp;

  Hero({required this.name, this.hp = 100});

  void attack() {
    hp--;
  }

  void run() {

  }
}

void main() {
  Hero hero = Hero(name: '홍길동');
}
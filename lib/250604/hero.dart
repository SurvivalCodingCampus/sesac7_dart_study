class Hero {
  String name;
  int hp;
  final int maxHP;

  Hero(this.name, this.hp) : maxHP = hp;

  void attack() {
    print('$name attacks with hp $hp!');
  }

  void run() {
    print('$name runs with hp $hp!');
  }

  void sleep() {
    print('$name sleeps');
  }
}

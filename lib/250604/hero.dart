class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

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





class Hero {
  String name;
  int hp;

  Hero({required this.name, required this.hp});

  void attack() {}

  void run() {}

  void sleep() {}
}

void main() {
  Hero _oh = Hero(name: 'hero', hp: 10);
}

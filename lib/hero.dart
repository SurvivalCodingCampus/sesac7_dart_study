class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  void attack() {
    hp--;
  }

  void run() {}
}

void main() {
  Hero hero = Hero('홍길동', 100);

  String name = '홍길동';
  int i = 10;

}
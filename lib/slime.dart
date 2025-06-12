class Slime {
  final int level = 10;

  int hp;
  String suffix;

  Slime(this.hp, this.suffix);

  void run() {
    print('슬라임 $suffix가 도망갔다.');
  }
}
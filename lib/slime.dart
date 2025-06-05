class Slime {
  int hp;
  String suffix;

  static const int defaultLevel = 10;
  final int level;

  /// default level은 10(생성 시 인자전달이 없다면 default값을 넣는다.
  Slime(this.hp, this.suffix, {this.level = defaultLevel});

  void attack() {}
  void run() {}
  void sleepGas() {}
}
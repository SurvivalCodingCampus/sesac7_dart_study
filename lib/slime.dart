class Slime {
  int hp;
  String suffix;

  static const int defaultLevel = 10;
  final int level;

  /// 기본 레벨은 10입니다. 생성 시 레벨을 지정하지 않으면 기본값이 사용됩니다.
  Slime(this.hp, this.suffix, {this.level = defaultLevel});

  void attack() {}
  void run() {}
  void sleepGas() {}
}
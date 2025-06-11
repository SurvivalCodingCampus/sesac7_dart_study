class Slime {
  int hp;
  String suffix;

  static const int defaultLevel = 10;
  final int level;

  /// 기본 레벨은 10입니다. 생성 시 레벨을 지정하지 않으면 기본값이 사용됩니다.
  Slime(this.hp, this.suffix, {this.level = defaultLevel}) {
    // hp가 0 이하라면 throw를 던진다.
    if (hp <= 0) {
      throw ArgumentError('HP는 0보다 커야 합니다.');
    }
  }

  void attack() {
    // TODO: 공격 로직 구현
  }
  void run() {
    // TODO: 도망 로직 구현
  }
  void sleepGas() {
    // TODO: 수면 가스 로직 구현
  }

  // 클래스 생성 후 디버깅과 테스트를 위해 toString 메서드 추가
  @override
  String toString() {
    return 'Slime{hp: $hp, suffix: $suffix, level: $level}';
  }
}
class Wand {
  String _name; // 이름
  double _power; // 마력
  final int nameLengthStandard = 3; // 이름 길이 한도
  final double lowPowerStandard = 0.5; // 마력 하한선
  final double highPowerStandard = 100.0; // 마력 상한선

  // getter
  String get name => _name;
  double get power => _power;

  // setter
  set name(String name) {
    if (name.length < nameLengthStandard) {
      throw Exception('지팡이의 이름이 너무 짧습니다. 이름은 3문자 이상으로 설정되어야합니다.');
    }

    // 지팡이 이름(_name)은 null을 허용하지 않는 String 타입이므로 조건문 생략
    _name = name;
  }

  set power(double power) {
    if (power < lowPowerStandard || power > highPowerStandard) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하로 설정되어야합니다.');
    }

    _power = power;
  }

  Wand({required String name, required double power})
    : _name = name,
      _power = power;
}

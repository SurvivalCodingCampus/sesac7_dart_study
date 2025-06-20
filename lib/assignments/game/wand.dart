class Wand {
  static const int minNameLength = 3;
  static const double minPower = 0.5;
  static const double maxPower = 100;

  String _name;
  double _power;

  Wand(
    this._name, {
    required double power,
  }) : _power = power;

  String get name => _name;
  double get power => _power;

  set name(String? value) {
    if (value == null || value.length < minNameLength) {
      throw Exception('이름은 $minNameLength문자 이상이어야 합니다.');
    }

    _name = value;
  }

  set power(double value) {
    if (value < minPower || value > maxPower) {
      throw Exception('지팡이의 마력은 $minPower 이상 $maxPower 이하여야 합니다.');
    }

    _power = value;
  }
}

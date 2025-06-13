class Wand {
  String _name;
  double _power;

  Wand(this._name, {required double power}) : _power = power;

  // 이름
  String get name {
    if (_name.length < 3) {
      throw Exception('지팡이 이름은 3자 이상이어야 합니다.');
    }

    return _name;
  }

  set name(String value) {
    if (value.length < 3) {
      throw Exception('지팡이 이름은 3자 이상이어야 합니다.');
    }

    _name = value;
  }

  // 파워
  double get power => _power;

  set power(double value) {
    if (value < 0.5 || value > 100) {
      throw Exception('마력은 0.5이상 100이하여야 합니다.');
    }

    _power = value;
  }
}

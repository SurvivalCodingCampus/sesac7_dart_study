class Wand {
  String _name;
  double _power;

  Wand(this._name, this._power) {
    name = _name;
    power = _power;
  }

  String get name => _name;

  double get power => _power;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('지팡이 이름은 3글자 이상이어야합니다.');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5 || value > 100.0) {
      throw Exception('지팡이의 마력은 0.5이상 100.0 이하여야 합니다.');
    }
    _power = value;
  }
}

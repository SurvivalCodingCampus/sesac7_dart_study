class Wand {
  String _name;
  double _power;

  Wand(this._name, this._power) {
    name = _name;
    power = _power;
  }

  String get name => _name;

  double get power => _power;

  set name(String newName) {
    if (newName.length < 3) {
      throw Exception('에러 : 지팡이 이름은 3자 이상');
    }
    _name = newName;
  }

  set power(double newPower) {
    if (newPower < 0.5 || newPower > 100.0) {
      throw Exception('에러 : 지팡이 마력은 0.5 이상 100.0 이하');
    }
    _power = newPower;
  }
}

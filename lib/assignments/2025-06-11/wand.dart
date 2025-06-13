class Wand {
  String _name;
  double _power;

  Wand(this._name, this._power) {
    name = _name;
    power = _power;
  }

  String get name => _name;

  double get power => _power;

  //어차피 이름 속성인 name이 null을 허용하지 않는 타입으로 선언을 했기때문에, 애초에 null허용을 하지않아서 따로 예외처리를 할 필요가 없다.
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

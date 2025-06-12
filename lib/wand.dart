class Wand {
  String _name;
  double _power;

  Wand(this._name, this._power);

  // getter
  String get name => _name;

  double get power => _power;

  // setter 및 유효성 검사 추가
  set setName(String value) {
    if (value.length >= 3) {
      _name = value;
    } else {
      throw Exception('이름은 3글자 이상이어야 합니다.');
    }
  }

  set setPower(double value) {
    if (value >= 0.5 && value <= 100) {
      _power = value;
    } else {
      throw Exception('지팡이의 마력은 0.5 이상 100 이하이어야 합니다.');
    }
  }
}

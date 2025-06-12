class Wand {
  String name;
  double power;

  Wand({required this.name, required this.power}) {
    setName(name);
    setPower(power);
  }

  void setName(String value) {
    if (value.length < 3) {
      throw Exception('지팡이의 이름은 3문자이상');
    }
    name = value;
  }

  void setPower(double value) {
    if (value < 0.5 || value > 100) {
      throw Exception('지팡이의 마력은 0.5이상 100.0이하여야 한다');
    }
    power = value;
  }
}

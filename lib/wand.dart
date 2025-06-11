class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
    : _name = name,
      _power = power;

  String get name => _name;

  double get power => _power;

  set name(String? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value.length < 3) {
      throw Exception('에러메세지');
    }
    _name = value;
  }

  set power(double? value) {
    if (value == null) {
      throw Exception('에러메세지');
    } else if (value < 0.5 || value > 100) {
      throw Exception('에러메세지');
    }
    _power = value;
  }
}

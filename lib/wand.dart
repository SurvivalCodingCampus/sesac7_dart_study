class Wand {
  String _name;
  double _power;

  final int _wandNameLimit = 3;
  final double _wandPowerMinValue = 0.5;
  final double _wandPowerMaxValue = 100.0;

  Wand({required String name, required double power}): _name = name, _power = power;

  String get wandName => _name;
  set wandName(String value) => {
    if (value.length < _wandNameLimit) {
      throw Exception('wnadName은 $_wandNameLimit문자 이상이어야 합니다.')
    }
    else {
      _name = value
    }
  };

  double get wandPower => _power;
  set wandPower(double value) => {
    if (value < _wandPowerMinValue || value > _wandPowerMaxValue) {
      throw Exception('wandPower는 $_wandPowerMinValue 이상 $_wandPowerMaxValue 이하로 설정해야 합니다.')
    } else {
      _power = value
    }
  };
}
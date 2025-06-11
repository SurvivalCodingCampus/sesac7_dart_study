class Wand {
  String _name;
  double _power;

  final int wandNameLimit = 3;
  final double wandPowerMinValue = 0.5;
  final double wandPowerMaxValue = 100.0;

  Wand({required String name, required double power}): _name = name, _power = power;

  String get wandName => _name;
  set wandName(String value) => {
    if (value.length < wandNameLimit) {
      throw Exception('wnadName은 $wandNameLimit문자 이상이어야 합니다.')
    }
    else {
      _name = value
    }
  };

  double get wandPower => _power;
  set wandPower(double value) => {
    if (value < wandPowerMinValue || value > wandPowerMaxValue) {
      throw Exception('wandPower는 $wandPowerMinValue 이상 $wandPowerMaxValue 이하로 설정해야 합니다.')
    } else {
      _power = value
    }
  };
}
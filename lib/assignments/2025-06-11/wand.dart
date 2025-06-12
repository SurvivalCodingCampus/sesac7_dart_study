class Wand {
  String _name;
  double _power;

  Wand(this._name, this._power);

  String get name => _name;
  double get power => _power;

  //name cannot be null, must be with length longer than 3
  //power should be between 0.5 and 100.0

  set name(String newName) {
    if (newName.length < 3) {
      throw Exception('Wand name must be longer than three characters.');
    }
    _name = newName;
  }

  set power(double newPower) {
    if (newPower < 0.5 || newPower > 100.0) {
      throw Exception('power should be between 0.5 and 100.0');
    }
    _power = newPower;
  }
}

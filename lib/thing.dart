abstract interface class Thing {
  double _weight;

  double get weight => _weight;

  Thing({required double weight}) : _weight = weight;

  set weight(double value) {
    if (value > 0) {
      _weight = value;
    }
    _weight = 0;
  }
}

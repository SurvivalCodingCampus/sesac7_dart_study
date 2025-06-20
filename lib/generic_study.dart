void main() {
  // Pocket<int> pocket = Pocket();
  final pocket = Pocket<int>();
}

class Pocket<E extends Comparable> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  E? get() {
    return _data;
  }
}

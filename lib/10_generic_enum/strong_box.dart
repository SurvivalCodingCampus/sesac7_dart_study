class StrongBox<E> {
  E? _instance;

  void put(E instance) {
    _instance = instance;
  }

  get() {
    return _instance;
  }
}

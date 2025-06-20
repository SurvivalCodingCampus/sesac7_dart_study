class StrongBox<T> {
  T? _item;

  void put(T item) {
    this._item = item;
  }

  T? get() {
    return _item;
  }
}

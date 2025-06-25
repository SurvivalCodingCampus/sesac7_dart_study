class StrongBox<T> {
  T? _content;

  StrongBox({T? content}) : _content = content;

  T? get() {
    return _content;
  }

  void set(T item) {
    _content = item;
  }
}

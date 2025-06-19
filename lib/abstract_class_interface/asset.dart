abstract class Asset {
  String _name;
  int _price;

  String get name => _name;

  int get price => _price;

  Asset({required String name, required int price})
    : _name = name,
      _price = price;

  set name(String value) {
    _name = value;
  }

  set price(int value) {
    if (value < 0) {
      _price = 0;
    }
    _price = value;
  }
}

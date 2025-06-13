abstract class Asset {
  String _name;
  int _price;

  Asset({required String name, required int price})
    : _name = name,
      _price = price;

  // getter
  String get name => _name;

  int get price => _price;

  // setter
  set name(String name) => _name = name;

  set price(int price) => _price = price;
}

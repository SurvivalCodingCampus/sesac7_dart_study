abstract class Asset {
  String _name;
  int _price;
  String _color;

  Asset({required String name, required int price, required String color})
    : _name = name,
      _price = price,
      _color = color;

  // getter
  String get name => _name;

  int get price => _price;

  String get color => _color;

  // setter
  set name(String name) => _name = name;

  set price(int price) => _price = price;

  set color(String color) => _color = color;
}

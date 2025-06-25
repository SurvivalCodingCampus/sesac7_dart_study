abstract class Asset {
  String name;
  int _price;

  int get price => _price;

  Asset({required this.name, required int price}) : _price = price;

  set price(int value) {
    if (value < 0) {
      _price = 0;
    }
    _price = value;
  }
}

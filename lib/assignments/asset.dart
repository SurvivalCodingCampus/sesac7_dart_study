abstract class Asset {
  final String name;
  int _price;

  Asset({required this.name, required int price}) : _price = price;

  int get price => _price;

  set price(int value) {
    if (value < 0) {
      throw Exception('가격은 마이너스 불가');
    }
    _price = value;
  }
}

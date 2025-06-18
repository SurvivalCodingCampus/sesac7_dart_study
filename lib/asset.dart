abstract class Asset {
  String _name;
  int _price;

  Asset({required String name, required int price})
    : assert(price >= 0, '자산의 가격은 음수가 될 수 없습니다.'),
      _name = name,
      _price = price;

  // getter
  String get name => _name;

  int get price => _price;

  // setter
  set name(String name) => _name = name;

  set price(int price) {
    if (price < 0) {
      throw Exception('자산의 가격은 음수가 될 수 없습니다.');
    }

    _price = price;
  }
}

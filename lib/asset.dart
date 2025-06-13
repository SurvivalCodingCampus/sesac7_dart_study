abstract class Asset {
  final String _name;
  final int _price;

  String get name => _name;

  int get price => _price;

  Asset({required String name, required int price})
    : _name = name,
      _price = price;
}

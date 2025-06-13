abstract class TangibleAsset {
  String _name;
  int _price;
  String _color;

  TangibleAsset({
    required String name,
    required int price,
    required String color,
  }) : _name = name,
       _price = price,
       _color = color;

  // getter
  String get name => _name;

  int get price => _price;

  String get color => _color;

  // 필요한 경우 setter 추가
}

abstract class TangibleAsset {
  final String _name;
  final int _price;
  final String _color;

  String get name => _name;
  int get price => _price;
  String get color => _color;

  TangibleAsset(this._name, this._price, this._color);
}

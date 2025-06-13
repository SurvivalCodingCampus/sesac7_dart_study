import 'package:modu_3_dart_study/tangible_asset.dart';

class Book extends TangibleAsset {
  String _isbn;

  String get isbn => _isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required String isbn,
    required super.weight,
  }) : _isbn = isbn;

  set isbn(String value) {
    _isbn = value;
  }
}

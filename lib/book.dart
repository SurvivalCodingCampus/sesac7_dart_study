import 'package:modu_3_dart_study/tangible_asset.dart';

class Book extends TangibleAsset {
  String _isbn;

  // getter
  String get isbn => _isbn;

  // 필요한 경우 setter 추가

  Book({
    required super.name,
    required super.price,
    required super.color,
    required String isbn,
  }) : _isbn = isbn;
}

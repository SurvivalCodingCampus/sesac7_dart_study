import 'package:modu_3_dart_study/tangible_asset.dart';

class Book extends TangibleAsset {
  final String _isbn;

  String get isbn => _isbn;

  Book(super.name, super.price, super.color, String isbn) : _isbn = isbn;
}

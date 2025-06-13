import 'package:modu_3_dart_study/assignments/tangible_asset.dart';

class Book extends TangibleAsset {
  final String isbn;

  Book(
    super._weight, {
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}
